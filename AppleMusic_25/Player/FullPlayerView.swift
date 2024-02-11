import SwiftUI
import MediaPlayer

struct FullPlayerView: View {
    @Environment (\.presentationMode) var presentationMode
    
    @EnvironmentObject var audioModel: AudioModel
    private var song: String {
        audioModel.songs[audioModel.index].title
    }
    private var songAuthor: String {
        audioModel.songs[audioModel.index].author
    }
    private var songImage: String {
        audioModel.songs[audioModel.index].imageName
    }
    private var stopPlay: String {
        if !audioModel.isPlaying {
            return "play.fill"
        } else {
            return "pause.fill"
        }
    }
    
    @EnvironmentObject var audioManager: AudioManager
    @State private var soundLevel: Float = 0.3
    
    @State private var isDraggingSlider = false
    func formattedTime(_ time: TimeInterval) -> String {
        let minute = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minute, seconds)
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Image(songImage)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .cornerRadius(8)
                    .shadow(radius: 8)
                    .padding(.bottom, 20)
                Text(song)
                    .frame(alignment: .leading)
                    .bold()
                    .font(.system(size: 20))
                    .padding(0.01)
                Text(songAuthor)
                    .font(.system(size: 18))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            VStack{
                Slider(value: $audioManager.currentTime, in: 0...audioManager.duration) { editing in
                    isDraggingSlider = editing
                    if !editing {
                        audioManager.seek(to: audioManager.currentTime)
                        if audioModel.isPlaying {
                            audioManager.playPause()
                        }
                    }
                }
                .disabled(audioManager.duration.isZero)
                .accentColor(.gray)
                
                HStack{
                    Text(formattedTime(audioManager.currentTime))
                    Spacer()
                    Text(formattedTime(audioManager.duration))
                }
                .padding()
            }
            .frame(width: 380)
            
            HStack(alignment: .center) {
                Button {
                    audioModel.isPlaying.toggle()
                    if audioModel.index == 0 {
                        audioModel.index = audioModel.songs.count - 1
                    } else {
                        audioModel.index -= 1
                    }
                    audioManager.setupAudioPlayer(song)
                } label: {
                    Image(systemName: "backward.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                }
                Button {
                    audioModel.isPlaying.toggle()
                    audioManager.playPause()
                } label: {
                    Image(systemName: stopPlay)
                        .font(.system(size: 30))
                        .padding(.leading, 50)
                        .foregroundColor(.black)
                }
                Button {
                    audioModel.isPlaying.toggle()
                    audioModel.index += 1
                    if audioModel.index == audioModel.songs.count {
                        audioModel.index = 0
                    }
                    audioManager.setupAudioPlayer(song)
                } label: {
                    Image(systemName: "forward.fill")
                        .font(.system(size: 30))
                        .padding(.leading, 50)
                        .foregroundColor(.gray)
                }
            }
            .frame(height: 80)
            
            Slider(value: $soundLevel, in: 0.0...1.0, step: 0.1,
                   onEditingChanged: { _ in
                print(soundLevel)
                audioManager.setVolume(soundLevel)
                   }
               )
                .accentColor(.gray)
                .frame(width: 300)
        }
        .padding(.bottom, 80)
        .gesture(DragGesture().onEnded({ gesture in
            if gesture.translation.height > 100 {
                presentationMode.wrappedValue.dismiss()
            }
        }))
        .onAppear {
            audioManager.setupAudioPlayer(song)
            audioModel.isPlaying = true
        }
    }
}
