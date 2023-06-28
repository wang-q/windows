
```shell
# pytorch
pip install pysocks
# $ENV:ALL_PROXY='socks5h://localhost:10808'

pip uninstall torch
pip cache purge
pip install torch -f https://download.pytorch.org/whl/torch_stable.html

pip install -U openai-whisper

whisper --language Japanese --task translate --output_format srt sakura.wav

```
