# start from a clean base image (replace <version> with the desired release)
FROM runpod/worker-comfyui:5.1.0-base

# install custom nodes using comfy-cli
RUN comfy-node-install comfyui-kjnodes comfyui-ic-light ComfyUI-nunchaku

# download models using comfy-cli
# the "--filename" is what you use in your ComfyUI workflow
RUN comfy model download --url https://huggingface.co/mit-han-lab/nunchaku-flux.1-dev/resolve/main/svdq-int4_r32-flux.1-dev.safetensors --relative-path models\diffusion_models --filename flux.1-dev-int4.safetensors

COPY "Flux.1-Kontext -- Nunchaku.json" /comfyui/user/default/workflows/
