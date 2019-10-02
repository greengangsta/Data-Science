# Importing some commong libraries
import numpy as np 
import pandas as pd

# Preparing a dummy dataset to train the model to learn the square function 
x1 = list(np.random.randn(1,1000))
x2 = list(np.random.randn(1,1000))

y = []
for i in range(len(x1)):
	y.append(x1[i]+x2[i])

# Writing the data to a csv file as common norm suggests
data = np.vstack((x1,x2,y))
data = np.transpose(data)
#write = pd.DataFrame(data,columns = ['X1','X2','Y']).to_csv('data.csv')


# Reading the data
data = pd.read_csv('data.csv')

X = data.iloc[:100,0:2].values
y = data.iloc[:100,2:].values


# Splitting the data into training and test set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.1)

# Importing the regressor and fitting the data on the regressor model
from keras.layers import Dense
from keras.models import Sequential

model = Sequential()
model.add(Dense(1,input_dim = 2))
model.add(Dense(1))
model.compile(optimizer='adam',loss='mean_squared_error',metrics=['mae','accuracy'])

model.fit(X_train,y_train,batch_size = 2,epochs = 100)

# making the predictions on the test set
y_pred = model.predict(X_test)

test = np.asarray([[10,5],[4,3]])


print('Sum of the two values for test are : ', model.predict(test))



"""
Now what you have to do is make a web interface such that it interacts
with this regressor and when you provide an input at the web interface 
then it invokes this regressor and the regressor makes a prediction about
what the output should be. Have fun!

"""