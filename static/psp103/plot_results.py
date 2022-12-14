from DMT.core import Plot
import pandas as pd
import numpy as np

plt_tran = Plot("tran", x_label=r"$t \left( \si{\nano\second} \right)$", y_label=r"$V_{\mathrm{in}}, V_{\mathrm{out}}\left( \si{\volt} \right)$", x_scale=1e9)
plt_transfer = Plot("transfer", x_label=r"$V_{\mathrm{in}}\left( \si{\volt} \right)$", y_label=r"$V_{\mathrm{out}} \left( \si{\volt} \right)$", y_scale=1)
plt_curr = Plot("curr", x_label=r"$V_{\mathrm{in}}\left( \si{\volt} \right)$", y_label=r"$I_{\mathrm{DC}} \left( \si{\micro\ampere} \right)$", y_scale=1e6)
# plt_tran.x_limits = (0,2)
# plt_tran.y_limits = (0,25)

data = pd.read_csv("static/psp103/output_tran.csv", delimiter="\s+", header=0, index_col=False)
din = data["in"].to_numpy()
dout = data["out"].to_numpy()
t = data["time"].to_numpy()

data = pd.read_csv("static/psp103/output_dc.csv", delimiter="\s+", header=0, index_col=False)
din_dc = data["in"].to_numpy()
dout_dc = data["out"].to_numpy()
ic_dc = data["vmeas#branch"].to_numpy()

plt_tran.add_data_set(t, din)
plt_tran.add_data_set(t, dout)

plt_transfer.add_data_set(din_dc, dout_dc)
plt_curr.add_data_set(din_dc, ic_dc)

plt_curr.plot_py(show=False)
plt_transfer.plot_py(show=False)
plt_tran.plot_py(show=True)

for plt in [plt_curr, plt_tran, plt_transfer]:
   plt.save_tikz("static/psp103/plots/", standalone=True, build=True, clean=True, mark_repeat=3)