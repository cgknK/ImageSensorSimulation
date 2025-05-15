import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("results.csv", names=["width", "height", "flat_simd_time", "nested_time"])
df["speedup"] = df["nested_time"] / df["flat_simd_time"]

plt.figure(figsize=(10, 6))
plt.plot(df.index, df["flat_simd_time"], label="Flat SIMD", marker="o")
plt.plot(df.index, df["nested_time"], label="Nested", marker="x")
plt.title("Flat SIMD vs Nested Access Time")
plt.xlabel("Test Index")
plt.ylabel("Time (s)")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.savefig("timing_graph.png")
plt.show()
