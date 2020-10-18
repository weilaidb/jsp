package bean.seepicture;

import java.io.File;
import java.io.FilenameFilter;

class FileName implements FilenameFilter {
    @Override
    public boolean accept(File dir, String name) {
        boolean boo = false;
        if (name.endsWith(".jpg") || name.endsWith(".JPG")) {
            boo = true;
        }
        return boo;
    }
}


public class Play {
    int imageNumber = 0,  max;
    String pictureName[];

    public String getPlayImage() {
        playImage = new String("<img src=image/" + pictureName[imageNumber] + "" +
                " width=260 height=200></img>");
        return playImage;
    }

    public void setPlayImage(String playImage) {
        this.playImage = playImage;
    }

    String playImage;
    public Play(){
        File f = new File(".");//该文件被认为在Web引擎的/bin目录中
        String path = f.getAbsolutePath();
        path = path.substring(0, path.indexOf("bin") - 1);
        System.out.println("path: " + path);

        File dir = new File(path + "/webapps/image");
        pictureName = dir.list(new FileName());
        max = pictureName.length;
    }

    public int getImageNumber() {
        return imageNumber;
    }

    public void setImageNumber(int n) {
        if (n < 0) {
            n = max - 1;
        }
        if (n == max) {
            n = 0;
        }
        imageNumber = n;
    }


}

