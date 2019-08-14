import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


data = pd.read_csv('train.csv')

y = data.iloc[:,0:1].values
X  = data.iloc[:,1:].values

from sklearn.preprocessing import OneHotEncoder
onehotencoder = OneHotEncoder(categorical_features = [0])

y = onehotencoder.fit_transform(y)


X = np.reshape(X,(42000,28,28,1))

img = X[1,:,:]
img = np.reshape(img,(28,28))
plt.imshow(img,cmap = 'gray')


from keras.layers import Conv2D, MaxPooling2D, Dense, Flatten
from keras.models import Sequential

model = Sequential()

model.add(Conv2D(32,5,input_shape = (28, 28,1),activation = 'relu'))
model.add(MaxPooling2D((3,3)))

model.add(Conv2D(16,3,activation = 'relu'))
model.add(MaxPooling2D((2,2)))

model.add(Flatten())
model.add(Dense(10,activation = 'softmax'))

model.compile(optimizer = 'rmsprop', loss = 'categorical_crossentropy',metrics = ['accuracy'])

model.fit(X,y,batch_size = 1024,epochs = 10)

print(y.shape)
