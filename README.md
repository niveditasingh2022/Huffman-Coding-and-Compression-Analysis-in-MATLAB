# **Huffman Coding and Compression Analysis in MATLAB**
### **Project Overview**
This MATLAB project **simulates binary Huffman coding**, optimizes probabilities for **entropy and compression ratio**, and evaluates the impact of increasing block length on compression performance.

---

## **Features**
✔ **Generates a random binary sequence** based on predefined probabilities.  
✔ **Applies Huffman coding** to encode the sequence.  
✔ **Computes and analyzes the compression ratio.**  
✔ **Evaluates the effect of increasing block length** on compression efficiency.  
✔ **Plots compression ratio vs block length for comparative analysis.**

---

## **Project Structure**

---

## **Implementation Details**
### **1. Generating a Random Binary Sequence**
- The script initializes **probabilities (p0, p1)** for generating a binary sequence.
- A **random binary sequence** is created based on the probabilities (e.g., `0.2/0.8`, `0.1/0.9`, `0.5/0.5`).

### **2. Huffman Encoding**
- **Symbols and probabilities** are computed from the generated binary sequence.
- A **Huffman dictionary** is created for encoding.
- The sequence is **Huffman encoded**, and the **compression ratio** is calculated.

### **3. Compression Ratio Analysis**
- Compression ratio is initially **computed**.
- **Block length is increased** manually (ranging from **1000 to 100,000**).
- Compression ratio is **evaluated for different block lengths**.

### **4. Entropy Calculation**
- The entropy of the binary sequence is computed using:
  \[
  H(X) = -\sum p(x) \log_2 p(x)
  \]

### **5. Visualization**
- **Compression ratio vs block length** is plotted to observe trends.
- **Entropy is plotted as a reference** for comparison.

---

## **How to Run the Code**
1. **Open MATLAB.**
2. **Run the script** by executing:
   ```matlab
   main.m

