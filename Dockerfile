# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail comfyui-easy-use@1.3.4

# download models into comfyui
# fp8
RUN comfy model download --url https://huggingface.co/T5B/Z-Image-Turbo-FP8/blob/main/z-image-turbo-fp8-e4m3fn.safetensors --relative-path models/diffusion_models --filename Z-Image-Turbo-fp8-e4m3fn.safetensors
# fp16
#RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors --relative-path models/diffusion_models --filename z_image_turbo_bf16.safetensors

# RUN # Could not find URL for Qwen3_4b_fp8.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors --relative-path models/text_encoders --filename qwen_3_4b.safetensors

# RUN # Could not find URL for Z-Image-Vae.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors --relative-path models/vae --filename ae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
