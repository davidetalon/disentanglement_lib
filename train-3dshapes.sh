export DISENTANGLEMENT_LIB_DATA=~/dev/disentanglement_lib

# mkdir out_3dshapes
dlib_train --gin_config=examples/bvae/bvae-s0.gin --model_dir=out_3dshapes/bvae-s0;
# dlib_train --gin_config=examples/bvae/bvae-s1.gin --model_dir=out_3dshapes/bvae-s1; 
# dlib_train --gin_config=examples/bvae/bvae-s2.gin --model_dir=out_3dshapes/bvae-s2;

# dlib_train --gin_config=examples/btcvae/btcvae-s0.gin --model_dir=out_3dshapes/btcvae-s0;
# dlib_train --gin_config=examples/btcvae/btcvae-s1.gin --model_dir=out_3dshapes/btcvae-s1;
# dlib_train --gin_config=examples/btcvae/btcvae-s2.gin --model_dir=out_3dshapes/btcvae-s2;

# dlib_train --gin_config=examples/dipvae/dipvae-s0.gin --model_dir=out_3dshapes/dipvae-s0;      
# dlib_train --gin_config=examples/dipvae/dipvae-s1.gin --model_dir=out_3dshapes/dipvae-s1;      
# dlib_train --gin_config=examples/dipvae/dipvae-s2.gin --model_dir=out_3dshapes/dipvae-s2;      

# dlib_train --gin_config=examples/factorvae/factorvae-s0.gin --model_dir=out_3dshapes/factorvae-s0;
# dlib_train --gin_config=examples/factorvae/factorvae-s1.gin --model_dir=out_3dshapes/factorvae-s1;
# dlib_train --gin_config=examples/factorvae/factorvae-s2.gin --model_dir=out_3dshapes/factorvae-s2;

#### eval
# dlib_reproduce --model_dir=out_3dshapes/bvae-s0 --output_directory=3dshapes_eval/bvae-s0
# dlib_reproduce --model_dir=out_3dshapes/bvae-s1 --output_directory=3dshapes_eval/bvae-s1
# dlib_reproduce --model_dir=out_3dshapes/bvae-s2 --output_directory=3dshapes_eval/bvae-s2

# dlib_reproduce --model_dir=out_3dshapes/btcvae-s0 --output_directory=3dshapes_eval/btcvae-s0
# dlib_reproduce --model_dir=out_3dshapes/btcvae-s1 --output_directory=3dshapes_eval/btcvae-s1
# dlib_reproduce --model_dir=out_3dshapes/btcvae-s2 --output_directory=3dshapes_eval/btcvae-s2

# dlib_reproduce --model_dir=out_3dshapes/dipvae-s0 --output_directory=3dshapes_eval/dipvae-s0
# dlib_reproduce --model_dir=out_3dshapes/dipvae-s1 --output_directory=3dshapes_eval/dipvae-s1
# dlib_reproduce --model_dir=out_3dshapes/dipvae-s2 --output_directory=3dshapes_eval/dipvae-s2

# dlib_reproduce --model_dir=out_3dshapes/factorvae-s0 --output_directory=3dshapes_eval/factorvae-s0
# dlib_reproduce --model_dir=out_3dshapes/factorvae-s1 --output_directory=3dshapes_eval/factorvae-s1
# dlib_reproduce --model_dir=out_3dshapes/factorvae-s2 --output_directory=3dshapes_eval/factorvae-s2