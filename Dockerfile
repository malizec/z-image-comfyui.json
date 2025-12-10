FROM runpod/worker-comfyui:5.6.0-base

RUN comfy node install --exit-on-fail comfyui-easy-use@1.3.4

# --- Z-Image Turbo UNet (FP8) ---
# FIX: use /resolve/, not /blob/.
RUN comfy model download \
  --url https://huggingface.co/T5B/Z-Image-Turbo-FP8/resolve/main/z-image-turbo-fp8-e4m3fn.safetensors \
  --relative-path models/diffusion_models \
  --filename Z-Image-Turbo-fp8-e4m3fn.safetensors

# --- Qwen Text Encoder ---
# FIX: filename matches workflow: qwen_3_4b.safetensors
RUN comfy model download \
  --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors \
  --relative-path models/text_encoders \
  --filename qwen_3_4b.safetensors

# --- VAE ---
RUN comfy model download \
  --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors \
  --relative-path models/vae \
  --filename ae.safetensors

# --- Qwen3-VL Node ---
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/IuvenisSapiens/ComfyUI_Qwen3-VL-Instruct
