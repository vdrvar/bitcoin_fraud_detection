# Fraud Detection in Bitcoin Transactions using Graph Neural Networks

---

### **Project Description**
`bitcoin_fraud_detection` is a project aimed at detecting fraudulent Bitcoin transactions using Graph Neural Networks (GNNs). The project leverages the Elliptic dataset and combines the strengths of C++ for data preprocessing and Python for implementing and training the GNN model. This hybrid approach ensures efficient data handling and powerful machine learning capabilities.

---

### **Features**
- **Data Preprocessing in C++**: Efficient parsing and cleaning of transaction data.
- **Graph Construction**: Creation of a transaction graph using NetworkX.
- **Graph Neural Network (GNN)**: Implementation of a GNN using PyTorch Geometric for fraud detection.
- **Visualization**: Visualization of transaction graphs and model performance metrics using Plotly.

---

### **Project Structure**
```plaintext
bitcoin_fraud_detection/
│
├── data/
│   ├── filtered/
│   │   ├── filtered_classes.csv
│   │   ├── filtered_edgelist.csv
│   │   └── filtered_features.csv
│   └── unfiltered/
│       ├── elliptic_txs_classes.csv
│       ├── elliptic_txs_edgelist.csv
│       └── elliptic_txs_features.csv
│
├── src/
│   ├── data_preprocessing.cpp
│   └── CMakeLists.txt
│
├── training/
│   ├── data_preparation.ipynb
│   ├── gcn_model_weights.pth
│   ├── graph_data.pt
│   └── training.ipynb
│
├── visualization/
│   ├── data_plot.png
│   ├── data_predictions_plot.png
│   └── data_visualization.ipynb
│
├── README.md
└── LICENSE
```

### **Setup Instructions**

#### C++ Environment Setup
1. **Compile the C++ Code**:
   ```bash
   cd src
   mkdir build
   cd build
   cmake ..
   make
   ./data_preprocessing  

#### Python Environment Setup
1. **Install Python Dependencies**:
   ```bash
   cd training
   pip install -r requirements.txt


2. **Required Libraries**:
   - torch
   - torch-geometric
   - pandas
   - matplotlib
   - scipy
   - networkx
   - plotly
  
---

### **Running the Project**

#### 1. Data Preprocessing (C++):
Navigate to the `src` directory and run the data preprocessing script.
```bash
cd src/build
./data_preprocessing
```

This will generate filtered datasets in the `data/filtered/` and `data/unfiltered/` directory.


