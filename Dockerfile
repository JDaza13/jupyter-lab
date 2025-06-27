FROM python:3.12.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y wget unzip && \
    wget -q https://github.com/duckdb/duckdb/releases/download/v1.3.1/duckdb_cli-linux-amd64.zip && \
    unzip duckdb_cli-linux-amd64.zip && \
    mv duckdb /usr/local/bin/ && \
    chmod +x /usr/local/bin/duckdb && \
    rm duckdb_cli-linux-amd64.zip

RUN pip install --no-cache-dir \
    jupyterlab \
    pandas \
    pyarrow \
    duckdb \
    seaborn \
    matplotlib \
    plotly \
    ipykernel && \
    python -m ipykernel install --name "python3" --user
    
# Force JupyterLab to use dark theme by default
RUN mkdir -p /root/.jupyter/lab/user-settings/@jupyterlab/apputils-extension && \
    echo '{ "theme": "JupyterLab Dark" }' > /root/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings


EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]

