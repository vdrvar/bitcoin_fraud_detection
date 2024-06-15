#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <unordered_set>
#include <unordered_map>

void readCSV(const std::string &filename, std::vector<std::vector<std::string>> &data, bool hasHeader) {
    std::ifstream file(filename);
    std::string line;
    if (hasHeader) {
        std::getline(file, line); // Skip header
    }
    while (std::getline(file, line)) {
        std::stringstream ss(line);
        std::string item;
        std::vector<std::string> row;
        while (std::getline(ss, item, ',')) {
            row.push_back(item);
        }
        data.push_back(row);
    }
}

void writeCSV(const std::string &filename, const std::vector<std::vector<std::string>> &data, const std::vector<std::string> &header) {
    std::ofstream file(filename);
    if (!header.empty()) {
        for (size_t i = 0; i < header.size(); ++i) {
            file << header[i];
            if (i != header.size() - 1) {
                file << ",";
            }
        }
        file << "\n";
    }
    for (const auto &row : data) {
        for (size_t i = 0; i < row.size(); ++i) {
            file << row[i];
            if (i != row.size() - 1) {
                file << ",";
            }
        }
        file << "\n";
    }
}

int main() {
    std::vector<std::vector<std::string>> classes;
    std::vector<std::vector<std::string>> edgelist;
    std::vector<std::vector<std::string>> features;

    readCSV("../../data/unfiltered/elliptic_txs_classes.csv", classes, true);
    readCSV("../../data/unfiltered/elliptic_txs_edgelist.csv", edgelist, true);
    readCSV("../../data/unfiltered/elliptic_txs_features.csv", features, false);

    // Create a set of labeled node IDs
    std::unordered_set<std::string> labeledNodeIds;
    std::unordered_map<std::string, int> nodeLabels;

    for (const auto& row : classes) {
        if (row[1] != "unknown") {
            labeledNodeIds.insert(row[0]);
            nodeLabels[row[0]] = std::stoi(row[1]);
        }
    }

    // Filter features to include only labeled nodes
    std::vector<std::vector<std::string>> filteredFeatures;
    for (const auto& row : features) {
        if (labeledNodeIds.find(row[0]) != labeledNodeIds.end()) {
            filteredFeatures.push_back(row);
        }
    }

    // Filter edgelist to include only edges where both nodes are labeled
    std::vector<std::vector<std::string>> filteredEdgelist;
    for (const auto& row : edgelist) {
        if (labeledNodeIds.find(row[0]) != labeledNodeIds.end() &&
            labeledNodeIds.find(row[1]) != labeledNodeIds.end()) {
            filteredEdgelist.push_back(row);
        }
    }

    // Filter classes to include only labeled nodes
    std::vector<std::vector<std::string>> filteredClasses;
    for (const auto& row : classes) {
        if (labeledNodeIds.find(row[0]) != labeledNodeIds.end()) {
            filteredClasses.push_back(row);
        }
    }

    // Write filtered data to new CSV files
    std::vector<std::string> classHeader = {"txId", "class"};
    std::vector<std::string> edgeHeader = {"txId1", "txId2"};
    std::vector<std::string> featureHeader; // No header for features

    writeCSV("../../data/filtered/filtered_classes.csv", filteredClasses, classHeader);
    writeCSV("../../data/filtered/filtered_edgelist.csv", filteredEdgelist, edgeHeader);
    writeCSV("../../data/filtered/filtered_features.csv", filteredFeatures, featureHeader);

    std::cout << "Filtered datasets saved successfully!" << std::endl;
    return 0;
}
