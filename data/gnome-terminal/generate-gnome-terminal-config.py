import sys

import tomllib

def load_config(fname):
    with open(fname, "rb") as f:
        return tomllib.load(f)

def hex2rgb(hex):
    """
    #abcabc to rbg(1,12,2)
    """
    r = int(hex[1:3], 16)
    g = int(hex[3:5], 16)
    b = int(hex[5:7], 16)
    return f"rgb({r}, {g}, {b})"

# palette=['rgb(80,73,69)', 'rgb(204,36,29)', 'rgb(152,151,26)', 'rgb(215,153,33)', 'rgb(69,133,136)', 'rgb(177,98,134)', 'rgb(104,157,106)', 'rgb(168,153,132)', 'rgb(146,131,116)', 'rgb(251,73,52)', 'rgb(184,187,38)', 'rgb(218,189,47)', 'rgb(131,165,152)', 'rgb(211,134,155)', 'rgb(142,192,124)', 'rgb(218,189,47)']
def make_palette(config):
    for k in ["normal", "bright"]:
        for c in ["black", "red", "green", "yellow", "blue", "magenta", "cyan", "white"]:
            yield hex2rgb(config[k][c])

if __name__ == "__main__":
    config = load_config(sys.argv[1])
    palette = [ p for p in make_palette(config) ]
    print(f"{palette=}")
    #print(hex2rgb("#aabbcc"))
