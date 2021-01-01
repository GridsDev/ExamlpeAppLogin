import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// ------------------------------------------
struct Home : View {
    
    @State var show = false
    
    var body: some View {
        //
        NavigationView {
            ZStack {
                NavigationLink(destination: SignUp(show: self.$show),isActive: self.$show) {
                    Text("")
                }
                .hidden()
                
                SignIn(show: self.$show)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}
// ------------------------------------------

// ------------------------------------------
struct SignIn : View {
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        ZStack {
            
            ZStack(alignment: .topTrailing) {
                
                GeometryReader {_ in
                    
                    VStack {
                        // Image Logo
                        Image("logo")
                        
                        // Text Header
                        Text("Log in to your account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, 35)
                        
                        // Text Field Email
                        TextField("Email", text: self.$email)
                            .autocapitalization(.none)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color,lineWidth: 2))
                            .padding(.top, 25)
                        
                        // Text Field Password And Button
                        HStack(spacing: 15) {
                            // Text Field Password
                            VStack {
                                if self.visible {
                                    TextField("Password", text: self.$pass)
                                        .autocapitalization(.none)
                                } else {
                                    SecureField("Password", text: self.$pass)
                                        .autocapitalization(.none)
                                }
                            }
                            // Button eye password
                            Button(action: {self.visible.toggle()}) {
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        // Text Button Forget Password
                        HStack {
                            
                            Spacer()
                            
                            Button(action: {self.reset()}) {
                                Text("Forget Password")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Color"))
                            }
                        }
                        .padding(.top, 20)
                        
                        // Button Login
                        Button(action : {self.verify()}) {
                            Text("SignIn")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("Color"))
                        .cornerRadius(10)
                        .padding(.top, 25)
                    }
                    .padding(.horizontal, 25)
                }
                    
                // Button Register
                Button(action: {self.show.toggle()}) {
                    Text("Register")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                }
                .padding()
            }
            if self.alert {
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
    }
        
    // Func verify
    func verify() {
        if self.email != "" && self.pass != "" {
            
        } else {
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        }
    }
        
    // Func Reset
    func reset() {
        if self.email != "" {
            
        } else {
            self.error = "Email Id is empty"
            self.alert.toggle()
        }
    }
}
// ------------------------------------------

// ------------------------------------------
struct SignUp : View {
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        ZStack {
            ZStack(alignment: .topLeading){
                GeometryReader {_ in
                    VStack {
                        // Image Logo
                        Image("logo")
                        
                        // Text Header
                        Text("Log in to your account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, 35)
                        
                        // Text Field Email
                        TextField("Email", text: self.$email)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color,lineWidth: 2))
                            .padding(.top, 25)
                        // Text Field Password And Button
                        HStack(spacing: 15) {
                            // Text Field Password
                            VStack {
                                if self.visible {
                                    TextField("Password", text: self.$pass)
                                        .autocapitalization(.none)
                                } else {
                                    SecureField("Password", text: self.$pass)
                                        .autocapitalization(.none)
                                }
                            }
                            // Button eye password
                            Button(action: {self.visible.toggle()}) {
                                Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        HStack(spacing: 15) {
                            // Text Field Password
                            VStack {
                                if self.revisible {
                                    TextField("Re-enter", text: self.$repass)
                                        .autocapitalization(.none)
                                } else {
                                    SecureField("Re-enter", text: self.$repass)
                                        .autocapitalization(.none)
                                }
                            }
                            // Button eye password
                            Button(action: {self.revisible.toggle()}) {
                                Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(self.color)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.repass != "" ? Color("Color") : self.color,lineWidth: 2))
                        .padding(.top, 25)
                        
                        // Button Register
                        Button(action: {}) {
                            Text("Register")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("Color"))
                        .cornerRadius(10)
                        .padding(.top,25)
                    }
                    .padding(.horizontal, 25)
                }
                // Button Register
                Button(action: {self.show.toggle()}) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(Color("Color"))
                }
                .padding()
            }
            if self.alert {
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    // Func
    func register() {
        if self.email != "" {
            if self.pass == self.repass {
                
            } else {
                self.error = "Password Mismatch"
                self.alert.toggle()
            }
        } else {
            self.error = "Please fill all the content properly"
            self.alert.toggle()
        }
    }
}
// ------------------------------------------

// ------------------------------------------
struct ErrorView : View {
    
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error : String
    
    var body: some View {
        
        GeometryReader {_ in
            VStack {
                HStack {
                    Text("Error")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Text(self.error == "RESET" ? "Password reset link has been sent successfully" : self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                Button(action: {self.alert.toggle()}) {
                    Text(self.error == "RESET" ? "OK" : "Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top, 25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}
// ------------------------------------------
