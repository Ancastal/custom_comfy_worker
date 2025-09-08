# start from a clean base image (replace <version> with the desired release)
FROM valyriantech/comfyui-without-flux:latest

# install custom nodes using comfy-cli
RUN comfy-node-install comfyui-kjnodes comfyui-ic-light ComfyUI-nunchaku

# download models using comfy-cli
# the "--filename" is what you use in your ComfyUI workflow
RUN comfy model download --url https://huggingface.co/nunchaku-tech/nunchaku-flux.1-kontext-dev/resolve/main/svdq-int4_r32-flux.1-kontext-dev.safetensors --relative-path models\diffusion_models --filename flux.kontext-int4.safetensors
RUN comfy model download --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors --relative-path models\text_encoders --filename clip_l.safetensors
RUN comfy model download --url https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors --relative-path models\text_encoders --filename t5xxl_fp8_e4m3fn.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Lumina_Image_2.0_Repackaged/resolve/main/split_files/vae/ae.safetensors --relative-path models\vae --filename ae.safetensors
RUN comfy model download --url https://huggingface.co/Ancastal/Grace-Style-Kontext/resolve/main/Grace-Kontext_UltimateLoRA.safetensors --relative-path models\lora --filename Grace.safetensors

COPY "Flux.1-Kontext -- Nunchaku.json" /comfyui/user/default/workflows/default.json

CMD [ "comfy launch" ]
