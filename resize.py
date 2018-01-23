from PIL import Image
from resizeimage import resizeimage
import os


# change the following path
directory = "/Users/reza/Desktop/foodClassifier/dataset/test"

for filename in os.listdir(directory):
    if filename.endswith('.jpg'):
        with open(os.path.join(directory, filename), 'r+b') as f:
            with Image.open(f) as image:
                width, height = image.size
                if width <= height:
                    copy = resizeimage.resize_cover(image, [100, 100])
                else:
                    copy = resizeimage.resize_cover(image, [100, 100])
                copy.save(os.path.join(directory, 'final', filename), image.format)