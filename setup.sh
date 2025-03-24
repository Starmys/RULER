# conda create --name ruler -y python=3.11

# conda activate ruler
pip install Cython
conda install -c conda-forge libstdcxx-ng=12 -y
git clone https://github.com/Starmys/RULER.git
cd RULER/
pip install torch==2.4.0 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
sudo cp ~/.local/lib/python3.10/site-packages/nvidia/cudnn/include/cudnn*.h /usr/local/cuda/include/
sudo cp ~/.local/lib/python3.10/site-packages/nvidia/cudnn/lib/libcudnn* /usr/local/cuda/lib64/
pip install -r docker/requirements.txt

cd scripts/data/synthetic/json/
python -c "import nltk; nltk.download('punkt'); nltk.download('punkt_tab')"
python download_paulgraham_essay.py
bash download_qa_dataset.sh
cd ../../..

# bash run.sh /blob/models Qwen2.5-3B-512k-lc-39iters

# pip install git+https://github.com/Starmys/flash-attention.git@block-sparse