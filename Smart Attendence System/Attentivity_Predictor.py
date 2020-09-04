from scipy.spatial import distance
from imutils import face_utils
import imutils
import dlib
import cv2
import time

def eye_aspect_ratio(eye):
	A = distance.euclidean(eye[1], eye[5])
	B = distance.euclidean(eye[2], eye[4])
	C = distance.euclidean(eye[0], eye[3])
	ear = (A + B) / (2.0 * C)
	return ear
	
thresh = 0.30      #eye threshold set to 30% of fully awaken eye gave an optimum result of drowsiness 
frame_check = 20    #frame refresh rate set to 20 ms
detect = dlib.get_frontal_face_detector()
predict = dlib.shape_predictor("C:/Users/GOURAB/OneDrive/Desktop/Drowsiness_Detection-master/shape_predictor_68_face_landmarks.dat")  #change this to ur local location

(lStart, lEnd) = face_utils.FACIAL_LANDMARKS_68_IDXS["left_eye"]
(rStart, rEnd) = face_utils.FACIAL_LANDMARKS_68_IDXS["right_eye"]
cap=cv2.VideoCapture(0)
flag=0
inattentive_time=0 
lecture_time=time.time() #starts count of lecture time
while True:
	ret, frame=cap.read()
	frame = imutils.resize(frame, width=450)
	gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
	subjects = detect(gray, 0)
	for subject in subjects:
		shape = predict(gray, subject)
		shape = face_utils.shape_to_np(shape)   #converting to NumPy Array
		leftEye = shape[lStart:lEnd]
		rightEye = shape[rStart:rEnd]
		leftEAR = eye_aspect_ratio(leftEye)
		rightEAR = eye_aspect_ratio(rightEye)
		ear = (leftEAR + rightEAR) / 2.0
		leftEyeHull = cv2.convexHull(leftEye)
		rightEyeHull = cv2.convexHull(rightEye)
		cv2.drawContours(frame, [leftEyeHull], -1, (0, 255, 0), 1)
		cv2.drawContours(frame, [rightEyeHull], -1, (0, 255, 0), 1)
		end=0
		if ear < thresh:
			flag += 1
			print (flag)
			start=time.time()
			if flag >= frame_check:
				# calculate time blocks for inattentive time and sum
				
				cv2.putText(frame, "****************ALERT!****************", (10, 30),
					cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 0, 255), 2)
				cv2.putText(frame, "****************ALERT!****************", (10,325),
					cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 0, 255), 2)
			end=time.time()
			end = end - start # end here counts inattentive time for each instance
			inattentive_time = inattentive_time + end  
				#print ("Drowsy")
				
		else:
			flag = 0
	cv2.imshow("Frame", frame)
	key = cv2.waitKey(1) & 0xFF
	if key == ord("q"):
		break
current_time = time.time()
lecture_time = current_time - lecture_time   #gives net lecture time, substract inattentive time to get attentive... calculate attentive percentage.
attentive_time= lecture_time - inattentive_time
attendence_percentage= ( attentive_time / lecture_time ) * 100
print("Inattentivity is:", inattentive_time ,"\n")
print("Lecture Time is:", lecture_time ,"\n")
print("Attentive Time is:", attentive_time ,"\n")
print("Today's attendence is:", attendence_percentage ," % \n")
cv2.destroyAllWindows()
cap.stop()
