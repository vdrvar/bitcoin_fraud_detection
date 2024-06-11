# Fraud Detection in Bitcoin Transactions using Graph Neural Networks

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
```

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

#### Python Environment Setup
1. **Install Python Dependencies**:
   ```bash
   cd model
   pip install -r requirements.txt
   ```
2. **Required Libraries**:

- torch
- torch-geometric
- pandas
- matplotlib
- scipy

### Running the Project

#### 1. Data Preprocessing (C++):

Navigate to the src directory and run the data preprocessing script.
```bash
cd src/build
./data_preprocessing
```
This will generate processed_graph.csv in the data directory.

#### 2. Training the GNN Model (Python):

Navigate to the model directory and run the GNN model script.
```bash
cd model
python gnn_model.py
```

#### 3. Visualizing the Results (Python):

Navigate to the visualization directory and run the visualization script.
```bash
cd visualization
python visualize.py
```

### Usage

- **Training**: The GNN model can be trained using the `gnn_model.py` script. Adjust hyperparameters as needed within the script.
- **Visualization**: Use the `visualize.py` script to generate visualizations of the transaction graph and model performance metrics.

### License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Contributing
Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or bug fixes.

### Acknowledgments
- The Elliptic dataset: [Kaggle](https://www.kaggle.com/ellipticco/elliptic-data-set)
- PyTorch Geometric: [PyTorch Geometric](https://pytorch-geometric.readthedocs.io/en/latest/)

### Contact
For any questions or suggestions, please open an issue or contact the project maintainers.


