from main import *

input_image = "Backend/Images/input.jpg"
output, flag = image(input_image)
if flag ==0:
    print("The Edges were detected!!!!!")
    cv2.imwrite(pathImage+"Backend/Images/final.jpg", output)
elif flag ==1:
    print("Edges were not detected, returning back the original image")
    cv2.imwrite(pathImage+"Backend/Images/original.jpg", output)




    