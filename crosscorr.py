d = {'prcp': [0.1,0.2,0.3,0.0], 'stp': [0.0,0.1,0.2,0.3]}
df = pd.DataFrame(data=d)

df.corr()


def df_shifted(df, target=None, lag=0):
    if not lag and not target:
        return df       
    new = {}
    for c in cols:
        if c == target:
            new[c] = df[target]
        else:
            new[c] = df[c].shift(periods=lag)
    return  pd.DataFrame(data=new)

df_shifted(df, 'prcp', lag=-1)


df_new = df_shifted(df, 'prcp', lag=-1)
df_new.corr()
