## Self-supervised Structure-sensitive Learning (SSL)

### Introduction

SSL is a state-of-art deep learning methord for human parsing built on top of [Caffe](http://caffe.berkeleyvision.org).
This novel self-supervised structure-sensitive learning approach can impose human pose structures into parsing results without resorting to extra supervision (i.e., no
need for specifically labeling human joints in model training). The self-supervised learning framework can be injected into any advanced neural networks to help incorporate rich high-level knowledge regarding human joints from a global perspective and improve the parsing results.

This distribution provides a publicly available implementation for the key model ingredients reported in our latest [paper](http://arxiv.org/abs/1606.00915) which is accepted by CVPR2017.

Please consult and consider citing the following papers:

    @article{CP2016Deeplab,
      title={DeepLab: Semantic Image Segmentation with Deep Convolutional Nets, Atrous Convolution, and Fully Connected CRFs},
      author={Liang-Chieh Chen and George Papandreou and Iasonas Kokkinos and Kevin Murphy and Alan L Yuille},
      journal={arXiv:1606.00915},
      year={2016}
    }

    @inproceedings{CY2016Attention,
      title={Attention to Scale: Scale-aware Semantic Image Segmentation},
      author={Liang-Chieh Chen and Yi Yang and Jiang Wang and Wei Xu and Alan L Yuille},
      booktitle={CVPR},
      year={2016}
    }

### Look into People (LIP) Dataset

The SSL is trained and evaluated on our [LIP dataset](http://hcp.sysu.edu.cn/lip/) for human parsing. Please check it for more model details.


### Pre-trained models

We have released our trained models with best performance [here](https://drive.google.com/open?id=0BzvH3bSnp3E9eHMyVS1RbUVDems).


### Train and test

1. Download LIP dataset or prepare your own data.
2. Put the images(*,jpg) and segmentations(*.png) into ssl/human/data/images and ssl/human/data/labels
3. Put the train, val, test lists into ssl/human/list. Each type contains a list for path and a list for id (e.g., train.txt and train_id.txt) 
4. Download the pre-trained model and put it into ssl/human/model/attention/. You can also refer [DeepLab](https://bitbucket.org/aquariusjay/deeplab-public-ver2) for more models. 
5. Set up your init.caffemodel before training and test.caffemodel before testing. You can simply use a soft link.
6. The prototxt files for network config are saved in ssl/human/config
7. The computed features are saved in ssl/human/features. You can run the provided MATLAB script, show.m to generate visualizable results. Then you can run the Python script, test_human.py to evaluate the performance.