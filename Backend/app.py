from main import *
import base64
from flask import Flask,jsonify,request


app = Flask(__name__)



def convertToImage(imgData1):
    # print(imgData1)
    with open("Images/input.jpg",'wb') as output:
        output.write(base64.b64decode(imgData1["base64"]))

def convertToString(data):
    with open(data, "rb") as image_file:
        encoded_string = base64.b64encode(image_file.read())
    return encoded_string.decode('utf-8')

@app.route('/')
def index():
    return jsonify({"Inputs" : "base64code"})


@app.route('/upload',methods=['POST'])
def upload():
    image_data = request.get_json()
    # print(f"debugging the api{image_data}")
    convertToImage(image_data)
    input_image ="Images/input.jpg"
    output, flag = image(input_image)
    if flag == 0 and image_data["feature"]=="True":
        sharp_image = sharpen(output)
        super_resoluted_img = super_resolution(sharp_image)
        smooth()
        return({"result":"The Image Edged where detected",
                "output":convertToString("Images/final.jpg")})

    elif flag == 1 or image_data["feature"]=="False":
        
        sharp_image = sharpen(output)
        super_resoluted_img = super_resolution(sharp_image)
        smooth()
        return({"result":"The Image edged weren't detected but the quality of the image is increased",
                "output":convertToString("Images/final.jpg")})

if __name__ == '__main__':
    app.run(debug=True)