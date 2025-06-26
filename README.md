# 🧪 jupyter-lab

A lightweight, Dockerized **JupyterLab sandbox** for interactive Python data exploration, visualization, and experimentation — with batteries included.

Supports out-of-the-box loading of `.parquet`, `.csv`, and other datasets, plus plotting and fast querying via `pandas`, `duckdb`, and `plotly`.

---

## 🧱 Project Structure

```
jupyter-lab/
├── Dockerfile             # Python + Jupyter + data libraries
├── docker-compose.yml     # Mounts host folders and runs JupyterLab
├── data/                  # Place your input data here (.parquet, .csv, etc.)
└── src/                   # Your notebooks and Python scripts live here
```

---

## 🚀 Getting Started

### 1. Add your files

- Drop `.parquet`, `.csv`, and resources into the `data/` folder.
- Save notebooks, scripts, and other files in `src/`.

### 2. Build and run

```bash
docker compose build
docker compose up
```

JupyterLab will start on port **8888** and print a login URL with a token.

### 3. Open in browser

Visit the link shown in the terminal (`http://127.0.0.1:8888/?token=...`).

You'll see `/app/src/` and `/app/data/`, both mapped to your local folders.

---

## 🧪 Workflow

### Read data

```python
import pandas as pd
df = pd.read_parquet("data/my_dataset.parquet")
```

### Explore & plot

```python
import plotly.express as px
fig = px.histogram(df, x="some_column")
fig.show()
```

### Write results

```python
df.to_csv("src/cleaned_output.csv", index=False)
fig.write_html("src/my_plot.html")
```

---

## ⚡ Features

- ✅ JupyterLab with persistent `src/` and `data/` folders
- ✅ Plotting with `plotly`, `matplotlib`, and `seaborn`
- ✅ Fast queries on big files with `duckdb`
- ✅ Fully reproducible + isolated Python environment

---

## 📦 Preinstalled Python Libraries

- `pandas`
- `pyarrow`
- `duckdb`
- `plotly`
- `seaborn`
- `matplotlib`
- `jupyterlab`

---

## 🔚 To stop

```bash
docker compose down
```

---

## 💡 Use Cases

- Ad hoc data exploration
- Notebook-based ETL prototyping
- Querying large `.parquet` files without loading everything into memory
- A sandbox to test Python data code without cluttering your main environment

---

## 🧼 Clean rebuild (if needed)

```bash
docker compose build --no-cache
docker compose up
```
