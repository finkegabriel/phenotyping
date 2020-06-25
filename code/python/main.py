import matplotlib.pyplot as plt
import woodchiparray as chip

from skimage import data,filters

image = chip.woodchip() 
print("image ",image)
for l in image:
    edges = filters.sobel(l)
    print("after edges",l)
    spec = plt.imshow(edges,cmap='gray')
    plt.savefig('data2.png')
    plt.show()
    
