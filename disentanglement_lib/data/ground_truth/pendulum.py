# coding=utf-8
# Copyright 2018 The DisentanglementLib Authors.  All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Pendulum data set."""
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
import os
from disentanglement_lib.data.ground_truth import ground_truth_data
from disentanglement_lib.data.ground_truth import util
import numpy as np
from six.moves import range
import tensorflow.compat.v1 as tf
import h5py

PENDULUM_PATH = os.path.join(
    os.environ.get("DISENTANGLEMENT_LIB_DATA", "."), "pendulum",
    "pendulum.h5"
)



class Shapes3D(ground_truth_data.GroundTruthData):
  """Pendulum dataset.

  The data set was originally introduced in "CausalVAE: Disentangled Representation Learningvia Neural Structural Causal Models".

  The ground-truth factors of variation are:
  0 - Pendulum angles (84 different values)
  1 - Light position (88 different values)
  2 - Shadow lenght
  3 - Shadow position
  """

  def __init__(self):
    with h5py.File(PENDULUM_PATH, 'r') as f:
      # Data was saved originally using python2, so we need to set the encoding.
      data = np.load(f, encoding="latin1")
    images = data["images"]
    labels = data["labels"]
    n_samples = images.shape[0]
    self.images = (
        images.reshape([n_samples, 96, 96, 3]).astype(np.float32) / 255.)
    features = labels.reshape([n_samples, 4])
    self.factor_sizes = [84, 88, 0, 0] #TODO: shade_pos, shade_len
    self.latent_factor_indices = list(range(2))
    self.num_total_factors = features.shape[1]
    self.state_space = util.SplitDiscreteStateSpace(self.factor_sizes,
                                                    self.latent_factor_indices)
    self.factor_bases = np.prod(self.factor_sizes) / np.cumprod(
        self.factor_sizes)

  @property
  def num_factors(self):
    return self.state_space.num_latent_factors

  @property
  def factors_num_values(self):
    return self.factor_sizes

  @property
  def observation_shape(self):
    return [96, 96, 3]


  def sample_factors(self, num, random_state):
    """Sample a batch of factors Y."""
    return self.state_space.sample_latent_factors(num, random_state)

  def sample_observations_from_factors(self, factors, random_state, causally=True):
    all_factors = self.state_space.sample_all_factors(factors, random_state)
    
    masks = []
    for id_latent in range(self.num_total_factors):
      select_dim = data_labels[:, id_latent]
      mask = np.where(np.isin(select_dim, all_factors[:, id_latent]))
      masks.append(mask)
    
    # all the latens should be satisfied
    indexes = np.logical_and.reduce(masks)
    return self.images[indices]
