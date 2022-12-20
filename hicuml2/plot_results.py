from DMT.core import Plot
import pandas as pd
import numpy as np

plt_output = Plot("IC(VCE", x_label=r"$V_{\mathrm{CE}} \left( \si{\volt} \right)$", y_label=r"$I_{\mathrm{C}}\left( \si{\milli\ampere} \right)$", y_scale=1e3)
plt_output.x_limits = (0,2)
plt_output.y_limits = (0,25)

data = pd.read_csv("static/hicuml2/output.csv", delimiter="\s+", header=0, index_col=False)

vb = data["b"].to_numpy()
vb_unique = np.unique(vb)

for vb_i in vb_unique:
    data_i = data[np.isclose(data["b"], vb_i)]
    vc_i = data_i["v-sweep"].to_numpy()
    ic_i = data_i["vc#branch"].to_numpy()
    plt_output.add_data_set(vc_i, -ic_i)

#plt_output.plot_py(show=True)
plt_output.save_tikz("static/hicuml2/", standalone=True, build=True, clean=True, mark_repeat=10, png=True)