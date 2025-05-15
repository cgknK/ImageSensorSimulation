import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("results.csv", names=["width", "height", "flat_time", "nested_time"])
df["ratio"] = df["flat_time"] / df["nested_time"]

plt.figure(figsize=(10, 6))
plt.plot(df.index, df["flat_time"], label="Flat", marker="o")
plt.plot(df.index, df["nested_time"], label="Nested", marker="x")
plt.title("Flat vs Nested Access Time (Average over runs)")
plt.xlabel("Test Index")
plt.ylabel("Time (s)")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.savefig("timing_graph.png")
plt.show()
