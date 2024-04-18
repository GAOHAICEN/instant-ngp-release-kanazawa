python .\scripts\convert_video.py --input .\data\home2\IMG_2527.MOV  --output .\data\home2\data\ --show_image 1


@REM resize image
python .\scripts\rescale_images.py --input .\data\home\data\ --output .\data\home\data_convert\

@REM 
python scripts/colmap2nerf.py --colmap_matcher exhaustive --run_colmap --aabb_scale 16 --images data/home/data_convert


@REM: generate transform params
python scripts/colmap2nerf.py --aabb_scale 2 --images data/home2/data --text data/home2/sparse/0 --out data/home2/transform.json

@REM RUN DEMO
.\build\testbed.exe --scene data/home2



@REM RUN DEMO

python .\scripts\convert_video.py --input E:\NeRF\real_data\data\tussock\tussock.MOV  --output E:\NeRF\real_data\data\tussock\data\ --show_image 1 --scale 1
python scripts/colmap2nerf.py --aabb_scale 1 --images E:\NeRF\real_data\data\tussock\data --text E:\NeRF\real_data\data\tussock\sparse\0 --out E:\NeRF\real_data\data\tussock\transform.json

.\build\testbed.exe --scene E:\NeRF\real_data\data\tussock


python .\scripts\convert_video.py --input E:\NeRF\real_data\data\tussock_tiny\tussock.MOV  --output E:\NeRF\real_data\data\tussock_tiny\data\ --show_image 1 --scale 2
python scripts/colmap2nerf.py --aabb_scale 16 --images E:\NeRF\real_data\data\tussock_tiny\data --text E:\NeRF\real_data\data\tussock_tiny\sparse\0 --out E:\NeRF\real_data\data\tussock_tiny\transform.json
.\build\testbed.exe --scene E:\NeRF\real_data\data\tussock_tiny
