import SwiftOpenAI
import Foundation
import Observation

@Observable
final class ConvModel {
    var openAI = SwiftOpenAI(apiKey: "")

    var messages: [MessageChatGPT] = [.init(text: "Quiero que sea un cuestionario hacia el usuario una pregunta a la vez. Cada respuesta que des no puede pasar de 150 CARACTERES. Chat tiene que actual como si fuera le vicepresidente de un país, interesado por conocer de lo que ha hecho el usuario (el usuario es el presidente en este juego). Tu, chat, que actúa como vicepresidente, tienes que conseguir la siguiente información : Pregunta: ¿Qué comió hoy? Salida esperada: Algún tipo de alimento con el que se pueda calcular el CO2e generado. Pregunta: ¿Compró ropa nueva o algo electrónico nuevo? Salida esperada: Tipo de artículo comprado, así como cantidad. Pregunta: ¿Tuvo algún viaje importante Presidente? Salida esperada: Si / No If “Si”, Pregunta: ¿De qué lugar a qué lugar? ¿Fue en qué medio de transporte? Salida esperada: Dos lugares (calcular kilometraje automático), medio de transporte (multiplicar el km por el CO2 de ese transporte) Si el usuario no te da algo similar a la salida esperada, que el vicepresidente le vuelva a preguntar. Cuando el usuario/presidente haya respondido TODAS las preguntas, manda algo como siguiente mensaje “Gracias presidente, recuerde tomar buenas decisiones, (da recomendaciones, ej. “puede considerar en lugar de comprar ropa extranjera, realizar compras locales”), el futuro de sus ciudadanos está en sus manos, no queremos una guerra civil…” Despues de eso, motivar al presidente a que cuelgue la llamada.", role: .system)]
    
    var currentMessage: MessageChatGPT = .init(text: "", role: .assistant)
    
    var convCompleta: [String] = []
    var viceReciente: String = "Buen dia presi."
    private var lastID: Int = 0
    
    @MainActor
    func send(message: String) async {
        let myMessage = MessageChatGPT(text: message,
                                       role: .user)
        messages.append(myMessage)
        currentMessage = MessageChatGPT(text: "",
                                        role: .assistant)
        messages.append(currentMessage)
        
        let optionalParameters = ChatCompletionsOptionalParameters(temperature: 0.5,
                                                                   stream: false,
                                                                   maxTokens: 100)
        
        do {
            let chatCompletions = try await openAI.createChatCompletions(
                model: .gpt4(.base),
                messages: messages,
                optionalParameters: optionalParameters
            )
            
            chatCompletions.map {
                onReceive(newMessage: $0)
            }
        } catch {
            print("Error generating Chat Completion: ", error.localizedDescription)
        }
        
        // Update conversation state after processing the message
        updateConversation()
    }
    
    @MainActor
    private func onReceive(newMessage: ChatCompletionsDataModel) {
        guard let lastMessage = newMessage.choices.first else {
            return
        }
        
        currentMessage.text.append(lastMessage.message.content)
        if let lastIndex = messages.indices.last {
            messages[lastIndex].text = currentMessage.text
        }
    }
    
    private func updateConversation() {
        /*
        print("Prueba 14")
        print("Full chat: \(messages)")
        print("Last chat: \(String(describing: messages.last))")
        */
        for message in messages {
            var role = ""
                if message.role == .system {
                    role = "Vicepresidente"
                } else if message.role == .user {
                    role = "Presidente"
                }
            let text = message.text
            let id = lastID
            lastID += 1 // Increment the ID for each message
            convCompleta.append("\(id), \(text), \(role)")
            
            // Update the most recent Vice message
            let ultimoTexto = text
            /*
            if let lastCharacter = text.last {
                viceReciente = String(lastCharacter)
            }
             */
            viceReciente = ultimoTexto
            
        }
        
        //print("NuevoChat: \(convCompleta)")
        //print("ViceReciente: \(viceReciente)")
    }
}
