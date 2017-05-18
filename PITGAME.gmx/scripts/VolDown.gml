
newvol = max(0, audio_get_master_gain(0) - 0.2)
audio_set_master_gain(0, newvol);
