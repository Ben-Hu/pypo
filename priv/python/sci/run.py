import sys

import numpy as np
import pandas as pd

a = np.arange(15).reshape(3, 5)
b = pd.Series([1, 3, 5, np.nan, 6, 8])
c = pd.date_range("20130101", periods=6)
d = pd.DataFrame(np.random.randn(6, 4), index=c, columns=list("ABCD"))


print(sys.stdin.readline())
