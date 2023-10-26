import customtkinter
import tkinter

# consts start #
software_version = "v1.0"
# consts end #


# App class start #
class App(customtkinter.CTk):
    def __init__(self):
        super().__init__()
        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure(0, weight=1)
# App class start #


# app configs start #
customtkinter.set_appearance_mode("system")
customtkinter.set_default_color_theme("green")

app = App()
app.title(f"Обработчик сообщений {software_version}")
app.geometry("800x620+600+300")
app.resizable(False, False)
app.iconbitmap("images/circuit.ico")
# app configs end #


# panels config start #

#       status frame start         #
port_status_frame = customtkinter.CTkFrame(master=app,
                                           width=200,
                                           height=600,
                                           corner_radius=10)
port_status_frame.place(x=10, y=10)

label_frame_name = customtkinter.CTkLabel(master=port_status_frame,
                                          text="Состояние порта",
                                          width=120,
                                          height=25,
                                          corner_radius=8)
label_frame_name.grid(row=0, column=0)

label_port_name = customtkinter.CTkLabel(master=port_status_frame,
                                         text="Имя порта: ",
                                         width=120,
                                         height=25,
                                         corner_radius=8)
label_frame_name.grid(row=1, column=0)

label_is_port_open = customtkinter.CTkLabel(master=port_status_frame,
                                            text="Доступ к порту: ",
                                            width=120,
                                            height=25,
                                            corner_radius=8)
label_frame_name.grid(row=2, column=0)
#       status frame end            #


#       console frame start        #
port_console_frame = customtkinter.CTkFrame(master=app,
                                            width=350,
                                            height=600,
                                            corner_radius=10)
port_console_frame.place(x=220, y=10)

tabView = customtkinter.CTkTabview(port_console_frame,
                                   width=330,
                                   height=580)
tabView.place(x=10, y=10)
tabView.add("Ввод")
tabView.add("Вывод")

button_get_info = customtkinter.CTkButton(master=tabView.tab("Вывод"), text="Получить информацию")
button_get_info.place(relx=0.5, rely=0.05, anchor=tkinter.CENTER)

button_send_info = customtkinter.CTkButton(master=tabView.tab("Ввод"), text="Послать информацию")
button_send_info.place(relx=0.5, rely=0.05, anchor=tkinter.CENTER)

#               textBoxes config start              #
textbox_input = customtkinter.CTkTextbox(tabView.tab("Ввод"), width=330, height=550)
textbox_input.place(x=5, rely=0.1)
welcome_text = " > Введите команду"
textbox_input.insert("0.0", welcome_text)

textbox_output = customtkinter.CTkTextbox(tabView.tab("Вывод"), width=330, height=550)
textbox_output.place(x=5, rely=0.1)
textbox_output.configure(state="normal")
#               textBoxes config end                   #

#       tabview config end          #


#       buttons frame start         #
buttons_frame = customtkinter.CTkFrame(master=app,
                                       width=210,
                                       height=600,
                                       corner_radius=10)
buttons_frame.place(x=580, y=10)

buttons_label = customtkinter.CTkLabel(master=buttons_frame,
                                       text="Действия",
                                       width=120,
                                       height=25,
                                       corner_radius=8)
buttons_label.grid()
# buttons_label.grid(row=0,rowspan=10)

button_check_ports = customtkinter.CTkButton(master=buttons_frame, text="Узнать порты")
button_check_ports.grid()
# button_check_ports.grid(row=1,rowspan=10)

button_choose_port = customtkinter.CTkButton(master=buttons_frame, text="Выбрать порт")
button_choose_port.grid()
# button_choose_port.grid(row=2,rowspan=10)
#       buttons frame end           #

# panels config end #

app.mainloop()
