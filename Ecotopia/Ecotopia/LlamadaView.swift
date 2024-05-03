//
//  LlamadaView.swift
//  Ecotopia-GreenCity
//
//  Created by Sofía Cantú on 23/04/24.
//

import SwiftUI
import AVKit

struct LlamadaView: View {
    var llamadaModel: LlamadaModel
    @Binding var convModel: ConvModel
    @StateObject private var micModel = MicModel()
    @State private var recording = false
    
    @State private var showTypingIndicator = false

    @State var convCompleta: [String] = []
    //@State var viceReciente: String = "Soy el vice."
    @State var prompt: String = ""
    @State var lastID: Int = 0
    @State var images: [String] = ["ElVice"]
    
    var body: some View {
        
        ZStack{
            
            Color(red: 11/255, green: 31/255, blue: 56/255)
                .ignoresSafeArea()
        
            VStack {
                VStack {
                    switch llamadaModel.isLoadingTextToSpeechAudio {
                    case .isLoading:
                        if showTypingIndicator {
                            TypingIndicatorView()
                                .padding(.top, 60)
                        }
                        
                    case .noExecuted:
                        VStack {
                            Image(systemName: "waveform")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 120)
                                .foregroundColor(.white)
                            Text("LLAMADA DEL VICE")
                                .font(.system(size: 24))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                                .foregroundColor(.white)
                        }
                        .font(.system(size: 24))
                        .padding(.top, 60)
                        
                    case .finishedPlaying,
                            .finishedLoading:
                        VStack(alignment: .center) {
                            Button {
                                llamadaModel.playAudioAgain()
                            } label: {
                                Text(convModel.viceReciente)
                            }
                            .foregroundColor(Color(red: 206/255, green: 242/255, blue: 250/255))
                            .padding(.vertical, 20)
                            
                            ZStack {
                                Circle()
                                    .stroke(Color.white, lineWidth: 11)
                                    .overlay(
                                        Circle()
                                            .fill(Color.white.opacity(0.5))
                                    )
                                    .frame(width: 300, height: 300)

                                Image(images[0])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            
                            
                            // chat type
                            //ConversationView(convModel: $convModel)
                                //.frame(maxWidth: 10, maxHeight: 10)
                            
                            
                        }
                        .frame(width: 200,
                               height: 670,
                               alignment: .center)
                        //.border(Color.red, width: 1)
                    }
                }
                .padding(.horizontal, 32)
                .onAppear{
                    Task {
                        await convModel.send(message: prompt)
                        prompt = ""
                        
                        await llamadaModel.createSpeech(input: convModel.viceReciente)
                    }
                }
                
                Spacer()
                
                HStack {
                    TextField("Respondele al Vice.", text: $prompt, axis: .vertical)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(25)
                        .lineLimit(6)
                        .onSubmit {
                            Task {
                                await convModel.send(message: prompt)
                                prompt = ""
                                
                                await llamadaModel.createSpeech(input: convModel.viceReciente)

                            }
                        }
                    Button(action: {
                        Task {
                            await llamadaModel.createSpeech(input: convModel.viceReciente)
                            
                            await convModel.send(message: prompt)
                            prompt = ""
                            
                        }
                    }) {
                        Image(systemName: "paperplane.fill")
                            .foregroundColor(Color(red: 11/255, green: 31/255, blue: 56/255))
                            .frame(width: 44, height: 44)
                            .background(Color(red: 206/255, green: 242/255, blue: 250/255))
                            .cornerRadius(22)
                    }
                    .padding(.leading, 8)
                    
                    Button(action: {
                        self.recording.toggle()
                        if self.recording {
                            micModel.startRecording()
                        } else {
                            micModel.stopRecording()
                            // Opcional: Convierte el audio a Base64 para manejarlo como string
                            prompt = micModel.audioData.base64EncodedString()
                            print("Audio guardado: \(micModel.audioData.base64EncodedString())")
                            print("Audio guardado: \(micModel.audioData.base64EncodedString())")
                            print("Audio guardado: \(micModel.audioData.base64EncodedString())")
                            print(prompt)  // Aquí puedes enviar el string a donde necesites
                        }
                    }) {
                        HStack {
                            Text(recording ? "" : "")
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                            if recording {
                                Image(systemName: "pause.fill")
                                    .foregroundColor(Color(red: 11/255, green: 31/255, blue: 56/255))
                                    .frame(width: 44, height: 44)
                                    .background(Color(red: 206/255, green: 242/255, blue: 250/255))
                                    .cornerRadius(22)
                            } else {
                                Image(systemName: "mic.fill")
                                    .foregroundColor(Color(red: 11/255, green: 31/255, blue: 56/255))
                                    .frame(width: 44, height: 44)
                                    .background(Color(red: 206/255, green: 242/255, blue: 250/255))
                                    .cornerRadius(22)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                
                .onAppear {
                    NotificationCenter.default.addObserver(forName: .audioDataReady, object: nil, queue: .main) { notification in
                        if let dataString = notification.object as? String {
                            self.prompt = dataString
                        }
                    }

                    // Si da tiempo hay que mover las otras configuraciones aqui
                }
                .onDisappear {
                    NotificationCenter.default.removeObserver(self)
                }
                
            }
           
            
            .onAppear {
                // Mostrar el indicador de escritura al cargar la vista y luego simular una espera de 3 segundos
                showTypingIndicator = true
                Task {
                    try await Task.sleep(nanoseconds: 4_000_000_000)  // 3 segundos
                    showTypingIndicator = false
                    // Aquí puedes añadir código para cargar el audio o realizar otra acción
                }
            }
            
            
        }
        
        .onAppear {
            do {
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print("Failed to activate audio session")
            }
        }
        
        
    }
}

#Preview {
    LlamadaView(llamadaModel: .init(), convModel: .constant(.init()))
}
