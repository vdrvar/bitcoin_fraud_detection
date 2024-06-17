import pandas as pd
import networkx as nx
import plotly.graph_objects as go
import random
import os

# Load the filtered datasets
classes_df = pd.read_csv('../data/filtered/filtered_classes.csv')
edgelist_df = pd.read_csv('../data/filtered/filtered_edgelist.csv')
features_df = pd.read_csv('../data/filtered/filtered_features.csv', header=None)

# Rename columns for features_df
features_df.columns = ['txId'] + [f'feature_{i}' for i in range(1, features_df.shape[1])]

# Create a directed graph
G = nx.DiGraph()

# Add nodes with features and labels
for _, row in features_df.iterrows():
    tx_id = row['txId']
    features = row[1:].tolist()
    tx_class = classes_df.loc[classes_df['txId'] == tx_id, 'class'].values[0]
    G.add_node(tx_id, features=features, label=tx_class)

# Add edges
for _, row in edgelist_df.iterrows():
    G.add_edge(row['txId1'], row['txId2'])

# Subsample nodes for visualization
num_nodes = 2500  # Number of nodes to visualize
sampled_nodes = random.sample(list(G.nodes()), num_nodes)  # Convert to list
H = G.subgraph(sampled_nodes).copy()

# Create positions for the nodes using random_layout
pos = nx.random_layout(H)

# Extract node and edge information
edge_x = []
edge_y = []
for edge in H.edges():
    x0, y0 = pos[edge[0]]
    x1, y1 = pos[edge[1]]
    edge_x.append(x0)
    edge_x.append(x1)
    edge_x.append(None)
    edge_y.append(y0)
    edge_y.append(y1)
    edge_y.append(None)

node_x = []
node_y = []
node_color = []
node_text = []

# Color mapping for the classes
color_map = {
    1: 'red',  # Illicit
    2: 'green'  # Licit
}

# Add nodes and their attributes
for node in H.nodes():
    x, y = pos[node]
    node_x.append(x)
    node_y.append(y)
    label = int(H.nodes[node]['label'])  # Ensure label is an integer
    node_color.append(color_map[label])
    node_text.append(f"TxId: {node}<br>Class: {label}")

# Create the edge trace
edge_trace = go.Scatter(
    x=edge_x, y=edge_y,
    line=dict(width=0.5, color='#888'),
    hoverinfo='none',
    mode='lines',
    showlegend=False)  # Disable legend for edge trace

# Create the node trace
node_trace = go.Scatter(
    x=node_x, y=node_y,
    mode='markers',
    hoverinfo='text',
    text=node_text,
    marker=dict(
        showscale=False,
        color=node_color,
        size=10,
        line_width=2),
    showlegend=False)  # Disable legend for node trace

# Create the figure
fig = go.Figure(data=[edge_trace, node_trace],
                layout=go.Layout(
                    title='Bitcoin Transaction Network (Subsampled)',
                    titlefont_size=16,
                    showlegend=True,
                    hovermode='closest',
                    margin=dict(b=20,l=5,r=5,t=40),
                    annotations=[dict(
                        text="Subsampled network visualization of Bitcoin transactions",
                        showarrow=False,
                        xref="paper", yref="paper",
                        x=0.005, y=-0.002 )],
                    xaxis=dict(showgrid=False, zeroline=False),
                    yaxis=dict(showgrid=False, zeroline=False))
                )

# Add custom legend
fig.add_trace(go.Scatter(
    x=[None], y=[None],
    mode='markers',
    marker=dict(size=10, color='red'),
    legendgroup='Illicit',
    showlegend=True,
    name='Illicit'
))

fig.add_trace(go.Scatter(
    x=[None], y=[None],
    mode='markers',
    marker=dict(size=10, color='green'),
    legendgroup='Licit',
    showlegend=True,
    name='Licit'
))

# Save the figure
output_path = '../visualizations/bitcoin_transaction_network.png'
fig.write_image(output_path)

print(f"Visualization saved to {output_path}")
