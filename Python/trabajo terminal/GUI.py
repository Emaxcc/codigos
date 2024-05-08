# import tkinter and all its functions
from tkinter import * 

root = Tk() # create root window
root.title("GUI") # title of the GUI window
root.maxsize(1920,1080) # specify the max size the window can expand to
root.config(bg="skyblue") # specify background color

# Create left and right frames
left_frame = Frame(root, width=200, height=400, bg='grey')
left_frame.grid(row=0, column=0, padx=10, pady=5)
right_frame = Frame(root, width=200, height=400, bg='grey')
right_frame.grid(row=0, column=1, padx=10, pady=5)


############################################################
############################################################
############################################################
############################################################LEFT
# Create frames and labels in left_frame
Label(left_frame, text="Detección de objetos").grid(row=0, column=0, padx=5, pady=5)

# Display image in left_frame
image = PhotoImage(file="detectados.png")
original_image = image.subsample(2,2) # resize image using subsample
Label(left_frame, image=original_image).grid(row=1, column=0, padx=5, pady=5)

# Create tool bar left_frame
tool_bar = Frame(left_frame, width=180, height=185)
tool_bar.grid(row=2, column=0, padx=5, pady=5)

# Example labels that serve as placeholders for other widgets left_frame
Label(tool_bar, text="Objeto", relief=RAISED).grid(row=0, column=0, padx=5, pady=3, ipadx=10) # ipadx is padding inside the Label widget
Label(tool_bar, text="Posición en cm (x,y)", relief=RAISED).grid(row=0, column=1, padx=5, pady=3, ipadx=10)

# Example labels that could be displayed under the "Tool" menu left_frame
Label(tool_bar, text="1").grid(row=1, column=0, padx=5, pady=5)
Label(tool_bar, text="2").grid(row=2, column=0, padx=5, pady=5)
Label(tool_bar, text="3").grid(row=3, column=0, padx=5, pady=5)
Label(tool_bar, text="4").grid(row=4, column=0, padx=5, pady=5)
Label(tool_bar, text="5").grid(row=5, column=0, padx=5, pady=5)
##################################################################
Label(tool_bar, text="28.55816493719279,20.075085324232084").grid(row=1, column=1, padx=5, pady=5)
Label(tool_bar, text="35.05734571272529,19.765642775881684").grid(row=2, column=1, padx=5, pady=5)
Label(tool_bar, text="24.696886947023483,17.0580204778157").grid(row=3, column=1, padx=5, pady=5)
Label(tool_bar, text="39.68323320589842,13.383390216154721").grid(row=4, column=1, padx=5, pady=5)
Label(tool_bar, text="31.463681048607317,12.803185437997726").grid(row=5, column=1, padx=5, pady=5)

############################################################
############################################################
############################################################
############################################################RIGHT
# Create frames and labels in right_frame
Label(right_frame, text="Detección de boca").grid(row=0, column=0, padx=5, pady=5)

# Display image in right_frame
image2 = PhotoImage(file="rostrodetct.png")
original_image2 = image2.subsample(2,2) # resize image using subsample
Label(right_frame, image=original_image2).grid(row=1,column=0, padx=5, pady=5)

# Create tool bar right_frame
tool_bar = Frame(right_frame, width=180, height=185)
tool_bar.grid(row=2, column=0, padx=5, pady=5)

# Example labels that serve as placeholders for other widgets right_frame
Label(tool_bar, text="Boca", relief=RAISED).grid(row=0, column=0, padx=5, pady=3, ipadx=10) # ipadx is padding inside the Label widget
Label(tool_bar, text="Posición en cm (x,y)", relief=RAISED).grid(row=0, column=1, padx=5, pady=3, ipadx=10)

# Example labels that could be displayed under the "Tool" menu rigth_frame
Label(tool_bar, text="1").grid(row=1, column=0, padx=5, pady=5)
##################################################################
Label(tool_bar, text="100.35465476474745,92.803185437997726").grid(row=1, column=1, padx=5, pady=5)




root.mainloop()
