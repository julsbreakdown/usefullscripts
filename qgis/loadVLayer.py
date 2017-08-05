# -*- coding: utf-8 -*-
"""
Created on Mon Jul 31 13:40:40 2017

@author: jwaddle
description : loads all vector layers in the layertree
"""
import glob
import os

def load_vector_layers(path, extension='shp'):
    layers = glob.glob('%s/*.%s'%(path, extension))
    for layerPath in layers:
        layerName = os.path.basename(layerPath).split('.')[1]
        layer = QgsVectorLayer(layerPath, layerName, 'ogr')
        if layer.isValid():
            QgsProject.instance().addMapLayer(layer)
            iface.messageBar().pushMessage('loading layer {}'.format(), duration=1)
            

