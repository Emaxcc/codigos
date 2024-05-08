import numpy as np
import cv2
import glob



################ FIND CHESSBOARD CORNERS - OBJECT POINTS AND IMAGE POINTS #############################

chessboardSize = (9,6)
frameSize = (1920,1080)



# termination criteria
criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 30, 0.001)


# prepare object points, like (0,0,0), (1,0,0), (2,0,0) ....,(6,5,0)
objp = np.zeros((chessboardSize[0] * chessboardSize[1], 3), np.float32)
objp[:,:2] = np.mgrid[0:chessboardSize[0],0:chessboardSize[1]].T.reshape(-1,2)

size_of_chessboard_squares_mm = 24.70
objp = objp * size_of_chessboard_squares_mm


# Arrays to store object points and image points from all the images.
objpoints = [] # 3d point in real world space
imgpoints = [] # 2d points in image plane.


##images = glob.glob('*.jpg')
## = glob.glob('C:\Users\abis\Desktop\Fotos-cali')
images = glob.glob('C:/Users/abis/Desktop/Fotos-cali/**/*.jpg', recursive=True)


for image in images:

    img = cv2.imread(image)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    # Find the chess board corners
    ret, corners = cv2.findChessboardCorners(gray, chessboardSize, None)

    # If found, add object points, image points (after refining them)
    if ret == True:

        objpoints.append(objp)
        corners2 = cv2.cornerSubPix(gray, corners, (11,11), (-1,-1), criteria)
        imgpoints.append(corners)

        # Draw and display the corners
        cv2.drawChessboardCorners(img, chessboardSize, corners2, ret)
##        cv2.imshow('img', img)
##        cv2.waitKey(1000)


cv2.destroyAllWindows()




############## CALIBRATION #######################################################

ret, cameraMatrix, dist, rvecs, tvecs = cv2.calibrateCamera(objpoints, imgpoints, frameSize, None, None)


############## UNDISTORTION #####################################################

##TOMAR FOTO

##
##
##
##camera = cv2.VideoCapture(0)
##camera.set(cv2.CAP_PROP_FRAME_WIDTH,1920)
##camera.set(cv2.CAP_PROP_FRAME_HEIGHT,1080)
##
##return_value, frame0 = camera.read()
##cv2.imwrite('example.png', frame0)
####del(camera)
##camera.release()
##img = cv2.imread('example.png')


##ELEGIR FOTO DE BASE DE DATOS
img = cv2.imread('examplefood.jpg')

h,  w = img.shape[:2]
newCameraMatrix, roi = cv2.getOptimalNewCameraMatrix(cameraMatrix, dist, (w,h), 1, (w,h))



# Undistort
dst = cv2.undistort(img, cameraMatrix, dist, None, newCameraMatrix)

# crop the image
x, y, w, h = roi
dst = dst[y:y+h, x:x+w]
cv2.imwrite('comida.png', dst)


##
### Undistort with Remapping
##mapx, mapy = cv2.initUndistortRectifyMap(cameraMatrix, dist, None, newCameraMatrix, (w,h), 5)
##dst = cv2.remap(img, mapx, mapy, cv2.INTER_LINEAR)
##
### crop the image
##x, y, w, h = roi
##dst = dst[y:y+h, x:x+w]
####cv2.imwrite('caliResult2.png', dst)



# Reprojection Error
mean_error = 0

for i in range(len(objpoints)):
    imgpoints2, _ = cv2.projectPoints(objpoints[i], rvecs[i], tvecs[i], cameraMatrix, dist)
    error = cv2.norm(imgpoints[i], imgpoints2, cv2.NORM_L2)/len(imgpoints2)
    mean_error += error

print( "total error: {}".format(mean_error/len(objpoints)) )
print(ret)
print(cameraMatrix)
print(dist)

total error: 0.09857104470370572
ret=0.7475177675979029
cameraMatrix=np.array([[1.46476857e+03,0.00000000e+00,9.31282220e+02],
                       [0.00000000e+00,1.46286037e+03,5.07751983e+02],
                       [0.00000000e+00,0.00000000e+00,1.00000000e+00]])

dist=np.array([-0.36174555,0.11524758,0.00311455,0.00130546,-0.00052928])
