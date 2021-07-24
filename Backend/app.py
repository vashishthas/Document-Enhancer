from main import *

input_image = "Backend/Images/input.jpg"
output, flag = image(input_image)

cv2.imwrite(pathImage+"Backend/Images/output.jpg", output)
    
    