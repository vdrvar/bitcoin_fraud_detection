# Fraud Detection in Bitcoin Transactions using Graph Convolutional Networks (GCNs)

---

### **Project Description**
`bitcoin_fraud_detection` is a project aimed at detecting fraudulent Bitcoin transactions using Graph Convolutional Networks (GCNs). The project leverages the Elliptic dataset and combines the strengths of C++ for data preprocessing and Python for implementing and training the GCN model. This hybrid approach ensures efficient data handling and powerful machine learning capabilities.


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
   ```

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

This will generate filtered datasets in the `data/filtered/` directory using the `data/unfiltered/` directory. You might need to manually paste the data from Kaggle to `data/unfiltered/`, due to size limitations on Github.

#### 2. Training the GNN Model (Python):
Navigate to the `training` directory and run the `training.ipynb` notebook.
```bash
cd training
jupyter notebook training.ipynb
```

This will train the GNN model and save the model weights to `gcn_model_weights.pth`.

#### 3. Visualizing the Results (Python):
Navigate to the `visualization` directory and run the `data_visualization.ipynb` notebook.
```bash
cd visualization
jupyter notebook data_visualization.ipynb
```

### **Visualizations**

#### Data Plot
![Data Plot](visualization/data_plot.png)

#### Data Predictions Plot
![Data Predictions Plot](visualization/data_predictions_plot.png)

### **Usage**

- **Training**: The GNN model can be trained using the `training.ipynb` notebook. Adjust hyperparameters as needed within the notebook.
- **Visualization**: Use the `data_visualization.ipynb` notebook to generate visualizations of the transaction graph and model performance metrics.

### Aggregation Process

Each node's feature vector is updated based on its own features and the features of its direct neighbors. This can be summarized as follows:

#### First GCN Layer

Each node \( v \) aggregates features from its direct neighbors \( \mathcal{N}(v) \).

**New features for node \( v \):**
\[ 
\mathbf{h}_v^{(1)} = \sigma \left( \mathbf{W}_0 \mathbf{x}_v + \sum_{u \in \mathcal{N}(v)} \mathbf{W}_1 \mathbf{x}_u \right) 
\]

- **\(\mathbf{h}_v^{(1)}\)**: Updated feature vector for node \( v \) after the first layer.
- **\(\mathbf{x}_v\)**: Original feature vector of node \( v \).
- **\(\mathbf{W}_0\) and \(\mathbf{W}_1\)**: Learnable weight matrices.
- **\(\sigma\)**: Activation function (e.g., ReLU).

#### Second GCN Layer

Each node \( v \) again aggregates features from its direct neighbors, but now these features include the aggregated information from the first layer.

**New features for node \( v \):**
\[ 
\mathbf{h}_v^{(2)} = \sigma \left( \mathbf{W}_2 \mathbf{h}_v^{(1)} + \sum_{u \in \mathcal{N}(v)} \mathbf{W}_3 \mathbf{h}_u^{(1)} \right) 
\]

- **\(\mathbf{h}_v^{(2)}\)**: Updated feature vector for node \( v \) after the second layer.
- **\(\mathbf{W}_2\) and \(\mathbf{W}_3\)**: Learnable weight matrices for the second layer.

### Conclusion

In this model, each node aggregates information from its first-order neighbors in both GCN layers. Although the second GCN layer also considers first-order neighbors, these neighbors' features have already been influenced by their own neighbors in the previous layer. This way, each node indirectly incorporates second-order neighbor information as well. However, the direct aggregation occurs only from first-order neighbors in each GCN layer.


### **License**
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### **Contributing**
Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or bug fixes.

### **Acknowledgments**
- The Elliptic dataset: [Kaggle](https://www.kaggle.com/ellipticco/elliptic-data-set)
- PyTorch Geometric: [PyTorch Geometric](https://pytorch-geometric.readthedocs.io/en/latest/)

### **Contact**
For any questions or suggestions, please open an issue or contact the project maintainers.
