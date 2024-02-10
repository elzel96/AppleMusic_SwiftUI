import SwiftUI

class AudioModel: ObservableObject {
    @Published var songs = MusicSearchModel.models.filter { $0.type == "Песня"
    }
    @Published var index = 0
    @Published var isPlaying = false
}

struct MiniPlayerView: View {
    @State private var isFullScreenMode = false
    @StateObject private var audioModel = AudioModel()
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
        HStack(spacing: 10) {
            Image(songImage)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(4)
                .shadow(radius: 2)
                .padding(.leading, 30)
            Text(song)
                .font(.system(size: 18))
                .font(.subheadline)
                .foregroundColor(.black)
                .frame(width: 130, alignment: .leading)
                .padding(.leading, 10)
            Button {
                 audioModel.isPlaying.toggle()
            } label: {
                Image(systemName: stopPlay)
                    .font(.system(size: 30))
                    .padding(.leading, 30)
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
                    .foregroundColor(.gray)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        .frame(height: 80)
        .background(Color(UIColor.systemGray6))
        .padding(.bottom, 50)
        .onTapGesture {
            isFullScreenMode.toggle()
        }
        .sheet(isPresented: $isFullScreenMode) {
            FullPlayerView().environmentObject(audioModel)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MiniPlayerView()
    }
}
