from tkinter.ttk import *          #IMPORT TKINTER
from tkinter import *
import mysql.connector             #IMPORT SQL CONNECTOR
from tkinter import messagebox
mydb=mysql.connector.connect(          #CONNECT TO DATABASE
    host="127.0.0.1",
    user="aganta",
    password="aganta1234",
    port="3307",
    database="grocery"
)
mycursor=mydb.cursor()              #CREATE CURSOR
root=Tk()
root.title("Brand Data")
root.geometry("1200x700")
# CREATE LABEL
label1=Label(root,text="BRAND ID",width=20,height=2,bg="white").grid(row=0,column=0)
label2=Label(root,text="BRAND NAME",width=20,height=2,bg="white").grid(row=1,column=0)
label3=Label(root,text="QUANTITY",width=20,height=2,bg="white").grid(row=2,column=0)
label4=Label(root,text="PRICE",width=20,height=2,bg="white").grid(row=3,column=0)
#CREATE ENTRY AND GRID
e1=Entry(root,width=30,borderwidth=8)
e1.grid(row=0,column=1)
e2=Entry(root,width=30,borderwidth=8)
e2.grid(row=1,column=1)
e3=Entry(root,width=30,borderwidth=8)
e3.grid(row=2,column=1)
e4=Entry(root,width=30,borderwidth=8)
e4.grid(row=3,column=1)
#CREATE REGISTER FUNCTION
def Register():
    Brand_id=e1.get()
    dbBrand_id=""
    Select="select Brand_id from brand where Brand_id='%s'" %(Brand_id)    #EXECUTE THE SQL QUERY
    mycursor.execute(Select)
    result=mycursor.fetchall()
    for i in result:                                             #EXECUTE FOR LOOP
        dbBrand_id=i[0]
    if(Brand_id == dbBrand_id):
        messagebox.askokcancel("Information","Record Already exists")
    else:
        Insert="Insert into brand(Brand_id,Brand_name,quantity,price) values(%s,%s,%s,%s)"   #INSERT QUERY
        Brand_id=e1.get()
        Brand_name=e2.get()
        quantity=e3.get()
        price=e4.get()
        if(Brand_id !="" and Brand_name !="" and quantity !="" and price !="" ):
            Value=(Brand_id,Brand_name,quantity,price)
            mycursor.execute(Insert,Value)
            mydb.commit()
            messagebox.askokcancel("Information","Record inserted")
            e1.delete(0, END)
            e2.delete(0, END)
            e3.delete(0, END)
            e4.delete(0, END)

        else:
            if (Brand_id == "" and Brand_name == "" and quantity == "" and price == "" ):  #EXECUTE WLSE CONDITION
             messagebox.askokcancel("Information","New Entery Fill All Details")
            else:
             messagebox.askokcancel("Information", "Some fields left blank")
# CREATE DELETE FUNCTION
def Delete():
    Brand_id=e1.get()
    Delete="delete from brand where Brand_id='%s'" %(Brand_id)
    mycursor.execute(Delete)
    mydb.commit()
    messagebox.showinfo("Information","Record Deleted")
    e1.delete(0,END)
    e2.delete(0, END)
    e3.delete(0, END)
    e4.delete(0, END)
#CREATE UPDATE FUNCTION
def Update():
    Brand_id=e1.get()
    Brand_name=e2.get()
    quantity=e3.get()
    price=e4.get()
    Update="update brand set  Brand_name='%s', quantity='%s', price='%s' where Brand_id='%s' " % ( Brand_name, quantity, price,Brand_id)
    mycursor.execute(Update)
    mydb.commit()
    messagebox.showinfo("Info","Record Update")
    #CREATE SHOWALL FUNCTION
def Showall():
    class A(Frame):
        def __init__(self, parent):
            Frame.__init__(self, parent)
            self.CreateUI()
            self.LoadTable()
            self.grid(sticky=(N, S, W, E))
            parent.grid_rowconfigure(0, weight=1)
            parent.grid_columnconfigure(0, weight=1)
        def CreateUI(self):     #CREATE USER INTERFACE
            tv= Treeview(self)
            tv['columns']=('Brand_id', 'Brand_Name', 'quantity', 'price')
            tv.heading('#0',text='Brand_id',anchor='center')
            tv.column('#0',anchor='center')
            tv.heading('#1', text='Brand_Name', anchor='center')
            tv.column('#1', anchor='center')
            tv.heading('#2', text='quantity', anchor='center')
            tv.column('#2', anchor='center')
            tv.heading('#3', text='price', anchor='center')
            tv.column('#3', anchor='center')

            tv.grid(sticky=(N,S,W,E))
            self.treeview = tv
            self.grid_rowconfigure(0,weight=1)
            self.grid_columnconfigure(0,weight=1)
        def LoadTable(self):    #EXECUTE DATABASE TABLE
            Select="Select * from brand"
            mycursor.execute(Select)
            result=mycursor.fetchall()
            Brand_id=""
            Brand_Name=""
            quantity=""
            price=""

            for i in result:
                Brand_id=i[0]
                Brand_name=i[1]
                quantity=i[2]
                price=i[3]

                self.treeview.insert("",'end',text=Brand_id,values=(Brand_name,quantity,price))
    root=Tk()
    root.title("Overview Page")
    A(root)
#CREATE ALL BUTTON
button1=Button(root,text="Register",width=10,height=2,command=Register).grid(row=7,column=0)
button2=Button(root,text="Delete",width=10,height=2,command=Delete).grid(row=7,column=1)
button3=Button(root,text="Update",width=10,height=2,command=Update).grid(row=7,column=3)
button5=Button(root,text="Show All",width=10,height=2,command=Showall).grid(row=7,column=7)
root.mainloop()