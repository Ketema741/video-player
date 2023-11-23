class VideoModel {
  String videoTitle;
  String? videoThumbnail; // Make it nullable
  String videoUrl;
  String? videoDescription;

  VideoModel({
    required this.videoTitle,
    this.videoThumbnail, // Nullable parameter
    required this.videoUrl,
    this.videoDescription, // Nullable parameter
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      videoTitle: json['videoTitle'],
      videoThumbnail: json['videoThumbnail'] ?? "",
      videoUrl: json['videoUrl'],
      videoDescription: json['videoDescription'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'videoTitle': videoTitle,
      'videoThumbnail': videoThumbnail,
      'videoUrl': videoUrl,
      'videoDescription': videoDescription,
    };
  }

  @override
  String toString() {
    return 'VideoModel{videoTitle=$videoTitle, videoThumbnail=$videoThumbnail, videoUrl=$videoUrl, videoDescription=$videoDescription}';
  }
}
