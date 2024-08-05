import matplotlib.pyplot as plt

# Dados do benchmark em segundos
benchmarks = {
    "Quick Sort": {
        10000: 5.891 / 1000,
        20000: 16.16 / 1000,
        30000: 23.73 / 1000,
        40000: 38.08 / 1000,
        50000: 48.68 / 1000,
        60000: 66.66 / 1000,
        70000: 79.99 / 1000,
        80000: 89.80 / 1000,
        90000: 128.3 / 1000,
        100000: 125.4 / 1000
    },
    "Bubble Sort": {
        10000: 3.233,
        20000: 13.36,
        30000: 36.03,
        40000: 69.75,
        50000: 133.3,
        60000: 158.9,
        70000: 287.1,
        80000: 407.1,
        90000: 689.7,
        100000: 1110.8,
    }
}

# Criar o gráfico
fig, ax = plt.subplots()

# Adicionar dados de Quick Sort
qs_sizes = list(benchmarks["Quick Sort"].keys())
qs_times = list(benchmarks["Quick Sort"].values())
ax.plot(qs_sizes, qs_times, label='Quick Sort', marker='o')

# Adicionar dados de Bubble Sort
bs_sizes = list(benchmarks["Bubble Sort"].keys())
bs_times = list(benchmarks["Bubble Sort"].values())
ax.plot(bs_sizes, bs_times, label='Bubble Sort', marker='o')

# Configurar o gráfico
ax.set_xlabel('Tamanho da Lista')
ax.set_ylabel('Tempo (s)')
ax.set_title('Benchmark de Quick Sort vs Bubble Sort')
ax.legend()

# Exibir o gráfico
plt.show()
