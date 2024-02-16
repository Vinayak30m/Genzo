class QuoteService {
  static final List<String> quotes = [
    'In the rhythm of words, I find my voice - rapping is the heartbeat of my expression.',
    'शब्दों की ताल में, मैं पाता हूँ अपनी आवाज़ - रैपिंग मेरी अभिव्यक्ति की धड़कन है।',
    'शब्दांच्या ताळात, माझं स्वर - रॅपिंग माझ्या अभिव्यक्तीचं धड़कनारं आहे.',
    'Crafting verses, I paint my emotions - rapping, where every word becomes a melody.',
    'शेर बनाते समय, मैं अपनी भावनाओं को रंगता हूँ - रैपिंग, जहां हर शब्द एक सुर बनता है।',
    'वचन रचना करताना, माझ्या भावनांना रंगतो - रॅपिंग, जिथंपर्यंत प्रत्येक शब्द सुरांत बदलतंय.',
    'In the laughter of the audience, I find my stage - stand-up comedy, where humor is the universal language.',
    'दर्शकों की हंसी में, मैं पाता हूँ अपना स्टेज - स्टैंड-अप कॉमेडी, जहां हंसी एक सार्वभौमिक भाषा है।',
    'प्रेक्षकांचं हसण्यात, माझं पोडी मिळतंय - स्टॅंड-अप कॉमेडी, जिथं हास्य हे सर्वांगीण भाषा आहे।',
    'Turning life\' s absurdities into laughter - stand-up comedy, where every punchline is a shared moment of joy.',
    'जीवन की असारखापन को हंसी में बदलते हैं - स्टैंड-अप कॉमेडी, जहां प्रत्येक पंचलाइन एक साझा क्षण है।',
    'जीवनाचं विचारांतर करणारं हास्यमय बनवताना - स्टॅंड-अप कॉमेडी, जिथंपर्यंत प्रत्येक पंचलाइन हास्यभरपूर साझा क्षण आहे।',
    'Creating laughter with a single image - meme making, the art of turning pictures into a thousand words.',
    'एक ही छवि से हंसी बनाते हैं - मीम मेकिंग, तस्वीरों को हजारों शब्दों में बदलने की कला।',
    'एकच चित्रातून हास्य बनवताना - मीम मेकिंग, प्रत्येक चित्राचं हजारों शब्दांतर करणारं कला.',
    'A visual symphony of humor - meme making, where wit meets pixels to create laughter.',
    'हास्य की दृश्य संगीत - मीम मेकिंग, जहां हास्य और पिक्सेल मिलते हैं और हंसी बनती है।',
    'हास्याचं दृश्य संगीत - मीम मेकिंग, जिथं हास्य आणि पिक्सेल्स मिळून हास्य बनतंय.',
    'In the lines of destiny, stories unfold - palm reading, where hands hold secrets written in the language of fate.',
    'भविष्य की रेखाओं में, कहानियाँ खुलती हैं - पाम रीडिंग, जहां हाथों में छुपी हैं किस्मत की भाषा में लिखी हुई रहस्यों।',
    'भविष्याचं रेखांत, कथां उघडतंय - पाम रीडिंग, जिथं हातांत लपवलं आहे भविष्याचं भाषांतर.',
    'Hands as the canvas of fate - palm reading, where the lines tell tales of past, present, and destiny.',
    'हाथ भविष्य की चित्रपट की तरह - पाम रीडिंग, जहां रेखाएँ कहती हैं गुजरे, वर्तमान, और भविष्य की कहानियाँ।',
    'भविष्याचं चित्रपटांत हातांत - पाम रीडिंग, जिथं रेखांत पुन्हा गोष्टी सांगतंय गुजरे, वर्तमान, आणि भविष्याचं।',
    'Celestial whispers guide the journey - horoscope, where stars map the cosmic story of your life.',
    'स्वर्गीय फुसफुसाहट जीवन का मार्गदर्शन करती है - होरोस्कोप, जहां तारे आपके जीवन की ब्रह्मांडिक कहानी का मार्गदर्शन करते हैं।',
    'आकाशातील सुरील गोष्टी नेत्रे - हॉरोस्कोप, जिथं नक्षत्रे आपलं जीवनाचं ब्रह्मांडिक कथा मार्गदर्शन करतात.',
    'Astrological tales written in the stars - horoscope, where destiny\'s script unfolds in celestial ink.',
    'तारों में लिखी ज्योतिषीय कहानियाँ - होरोस्कोप, जहां भविष्य की पटकथा स्वर्गीय स्याही में खुलती है।',
    'नक्षत्रांत लिहिलेलं ज्योतिषीय किस्से - हॉरोस्कोप, जिथं भविष्याचं लेखन स्वर्गीय चिट्ठ्यात विकसीत होतंय.',
    'Unveiling the truth beyond myths - science versus superstition, where reason triumphs over shadows.',
    'कल्पनाओं के परे सच्चाई का पर्दाफ़ाश - विज्ञान बनाम अंधविश्वास, जहां तर्क पर छायाएँ कमजोर पड़ती हैं।',
    'मिथकंनाचं पर्दाफाश करणं - विज्ञान बनाम अंधविश्वास, जिथं तर्क पारंपरिक धुंदात किंवा अंधकारांत जिततंय.',
    'In the clash of beliefs, evidence prevails - science versus superstition, where facts illuminate the path of understanding.',
    'विश्वासों के टकराव में, सबूतों की जीत - विज्ञान बनाम अंधविश्वास, जहां तथ्यों से भरा है समझने का मार्ग।',
    'विश्वासांचं संघर्षांत, साक्षात्कारांचं विजय - विज्ञान बनाम अंधविश्वास, जिथं तथ्यांनी प्रकाशित केलेलं समजण्याचं मार्ग.',
    'Ancient wisdom for holistic living - Ayurveda, where nature\'s remedies heal the body, mind, and soul.',
    'संपूर्ण जीवन के लिए प्राचीन ज्ञान - आयुर्वेद, जहां प्राकृतिक उपाय शरीर, मन, और आत्मा को ठीक करते हैं।',
    'संपूर्ण आरोग्याच्या लाभांसाठी प्राचीन ज्ञान - आयुर्वेद, जिथं प्राकृतिक उपचार शरीर, मन, आणि आत्मा दखवतात.',
    'Harmony with nature\'s remedies - Ayurveda, where the balance of body and spirit leads to well-being.',
    'प्राकृतिक उपचारों के साथ सामंजस्य - आयुर्वेद, जहां शरीर और आत्मा का संतुलन स्वस्थता की दिशा में ले जाता है।',
    'प्राकृतिक उपायांसह सामंजस्य - आयुर्वेद, जिथं शरीर आणि आत्मा चे संतुलन सुखाच्या मार्गाने जातंय।',
  ];

  static Stream<String> getQuoteStream() async* {
    for (var quote in quotes) {
      await Future.delayed(Duration(seconds: 2));
      yield quote;
    }
  }
}
