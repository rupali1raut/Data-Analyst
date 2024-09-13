import pandas as p
import numpy as n
import seaborn as sns
import matplotlib.pyplot as plt

p.set_option('display.max_rows', None)
p.set_option('display.expand_frame_repr', False)

df=p.read_csv("crimes_in_india.csv")
# print(df)

# df1=df.shape
# print(df1)
#
# df2=df.info()
# print(df2)
df.drop(["ATTEMPT TO MURDER"], axis=1, inplace=True)
# df3= df.info()
# print(df3)
# print(df)
#fetching all the cloumns
#df5=df.columns
#print(df5)
#rename the column
df.rename(columns={"District": "City"}, inplace=True)
print(df)
#fillna where data=0
df.fillna({"Year" : 2002 },inplace=True)
print(df)
df.fillna(method="ffill", inplace=True)
print(df)
# replacing one set of list with other
df.replace(["MAHARASHTRA","MANIPUR","MEGHALAYA","MIZORAM","NAGALAND","ODISHA","PUNJAB","RAJASTHAN"],
           ["MH","MN","ME","MI","NA","OD","PN","RJ"],inplace=True)
print(df)
# removing total row
df7=df.drop([45,55,63,72,84,119,144,177])
print(df7)
# groupby showing data
g1=df7.groupby("State")
g=df7.groupby("State")[["MURDER","City"]].max()
print(g)
# for State, i in g:
#     print(State)
#     print(i)
# # removing total row
# df7=df.drop([45,55,63,72,84,119,144,177])
# print(df7)
# a=g.get_group("MH")
# print(a)
# b=g.max()
# print(b)
c=g1[["MURDER","RAPE"]].describe()
print(c)

ax=sns.countplot(x="State",data=df7)
ax.bar_label(ax.containers[0])
print(ax)
plt.show()

outlier=df[df.State("MH")>]
