# pip install torch openai-whisper
# python3 main.py
# /venv/bin/python main.py
print("start")

import sys
import torch
import whisper
import warnings
from torch.multiprocessing import Process, Queue


warnings.filterwarnings("ignore")

model = whisper.load_model("small.en").to("cpu")

def transcribe_audio(audio_file):
    result = model.transcribe(audio_file)
    print(result["text"])

transcribe_audio("sample.mp3")

print("bye bye")
