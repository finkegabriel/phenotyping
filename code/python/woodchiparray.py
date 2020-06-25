import cv2
import glob
import numpy as np

def listtoString(s):
    str1 = ""
    for ele in s:
        str1 += ele

    return str1

def woodchip():
    x_data = []
    files = glob.glob("../../images/WoodChips/3.jpg")
    print(files)
    for mfile in files:
        print(mfile)
        image =cv2.imread(mfile)  
        x_data.append(image)
    print(np.array(x_data).shape)
    return np.array(x_data)
#file = open('data.txt','w')
#file.write(listtoString(np.array(x_data)))
#file.close()
