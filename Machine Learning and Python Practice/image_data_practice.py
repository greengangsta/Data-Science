import numpy as np 
import pandas as pd
import matplotlib.pyplot as plt


img = np.random.randn(100,100)

img = np.reshape(img,(28,28))

plt.imshow(img,cmap = 'gray')

from keras.preprocessing.image import ImageDataGenerator

gen = ImageDataGenerator(rotation_range = 20,width_shift_range = 0.2,height_shift_range = 0.3,shear_range = 0.3,zoom_range = 0.2,vertical_flip = True,horizontal_flip = True,preprocessing_function = preprocess_input)

train_gen = gen.flow_from_directory(training_path,target_size = IMAGE_SIZE)