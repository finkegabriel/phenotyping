#import matplotlib.pyplot as plt 
#%matplotlib inline
import skimage as io
image = io.data.coins()
print("data ",image)
# ... or any other NumPy array!
ax = io.imshow(image)
io.show()

#io.imshow(edges, cmap='gray')

