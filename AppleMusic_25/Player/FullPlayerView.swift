import SwiftUI

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
            
            HStack(alignment: .center) {
                Button {
                    if audioModel.index == 0 {
                        audioModel.index = audioModel.songs.count - 1
                    }
                    audioModel.index -= 1
                } label: {
                    Image(systemName: "backward.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                }
                Button {
                    audioModel.isPlaying.toggle()
                } label: {
                    Image(systemName: stopPlay)
                        .font(.system(size: 30))
                        .padding(.leading, 50)
                        .foregroundColor(.black)
                }
                Button {
                    audioModel.index += 1
                    if audioModel.index == audioModel.songs.count - 1 {
                        audioModel.index = 0
                    }
                } label: {
                    Image(systemName: "forward.fill")
                        .font(.system(size: 30))
                        .padding(.leading, 50)
                        .foregroundColor(.gray)
                }
            }
            .frame(height: 80)
        }
        .padding(.bottom, 80)
        .gesture(DragGesture().onEnded({ gesture in
            if gesture.translation.height > 100 {
                presentationMode.wrappedValue.dismiss()
            }
        }))
    }
}
