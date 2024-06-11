# Bitcoin Fraud Detection

---

## **bitcoin_fraud_detection: Fraud Detection in Bitcoin Transactions using Graph Neural Networks**

---

### **Project Description**
bitcoin_fraud_detection is a project aimed at detecting fraudulent Bitcoin transactions using Graph Neural Networks (GNNs). The project leverages the Elliptic dataset and combines the strengths of C++ for data preprocessing and Python for implementing and training the GNN model. This hybrid approach ensures efficient data handling and powerful machine learning capabilities.

---

### **Features**
- **Data Preprocessing in C++**: Efficient parsing and cleaning of transaction data.
- **Graph Construction**: Creation of a transaction graph using Boost.Graph.
- **Graph Neural Network (GNN)**: Implementation of a GNN using PyTorch Geometric for fraud detection.
- **Performance Optimization**: Integration of custom C++ operations for performance-critical tasks.
- **Visualization**: Visualization of transaction graphs and model performance metrics.

---

### **Project Structure**
```plaintext
bitcoin_fraud_detection/
│
├── data/
│   ├── elliptic_txs_classes.csv
│   ├── elliptic_txs_edgelist.csv
│   ├── elliptic_txs_features.csv
│   └── processed_graph.csv
│
├── src/
│   ├── data_preprocessing.cpp
│   └── CMakeLists.txt
│
├── model/
│   ├── gnn_model.py
│   └── requirements.txt
│
├── visualization/
│   └── visualize.py
│
├── README.md
└── LICENSE

### Setup Instructions

#### C++ Environment Setup
1. **Install Boost and Eigen**:
   - Boost: [Boost Installation Guide](https://www.boost.org/doc/libs/1_75_0/more/getting_started/unix-variants.html)
   - Eigen: [Eigen Installation Guide](https://eigen.tuxfamily.org/dox/GettingStarted.html)

2. **Compile the C++ Code**:
   ```bash
   cd src
   mkdir build
   cd build
   cmake ..
   make
   ./data_preprocessing
   ```
