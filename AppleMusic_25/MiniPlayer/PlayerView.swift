import SwiftUI

struct PlayerView: View {
    var body: some View {
        HStack(spacing: 10) {
            Rectangle()
                .fill(Color(UIColor.systemGray4))
                .frame(width: 60, height: 60)
                .cornerRadius(4)
                .shadow(radius: 2)
                .overlay(
                    Image(systemName: "music.note")
                                       .resizable()
                                       .foregroundColor(.white)
                                       .frame(width: 20, height: 30)
                    )
                .padding(.leading, 30)
            Text("Не исполняется")
                .font(.system(size: 18))
                .font(.subheadline)
                .foregroundColor(Color(UIColor.systemGray))
            Image(systemName: "play.fill")
                .font(.system(size: 40))
                .padding(.leading, 30)
            Image(systemName: "forward.fill")
                .font(.system(size: 40))
                .foregroundColor(Color(UIColor.systemGray4))
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        .frame(height: 80)
        .background(Color(UIColor.systemGray6))
        .padding(.bottom, 50)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}

